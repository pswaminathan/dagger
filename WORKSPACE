# Copyright (C) 2017 The Dagger Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

workspace(name = "dagger")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

#############################
# Load nested repository
#############################

# Declare the nested workspace so that the top-level workspace doesn't try to
# traverse it when calling `bazel build //...`
local_repository(
    name = "examples_bazel",
    path = "examples/bazel",
)

#############################
# Load Bazel-Common repository
#############################

#############################
# Load Bazel Skylib rules
#############################

BAZEL_SKYLIB_VERSION = "1.2.1"

BAZEL_SKYLIB_SHA = "f7be3474d42aae265405a592bb7da8e171919d74c16f082a5457840f06054728"

http_archive(
    name = "bazel_skylib",
    sha256 = BAZEL_SKYLIB_SHA,
    urls = [
        "https://github.com/bazelbuild/bazel-skylib/releases/download/{version}/bazel-skylib-{version}.tar.gz".format(version = BAZEL_SKYLIB_VERSION),
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

#############################
# Load Protobuf dependencies
#############################

# rules_python and zlib are required by protobuf.
# TODO(ronshapiro): Figure out if zlib is in fact necessary, or if proto can depend on the
# @bazel_tools library directly. See discussion in
# https://github.com/protocolbuffers/protobuf/pull/5389#issuecomment-481785716
# TODO(cpovirk): Should we eventually get rules_python from "Bazel Federation?"
# https://github.com/bazelbuild/rules_python#getting-started

http_archive(
    name = "rules_python",
    sha256 = "e5470e92a18aa51830db99a4d9c492cc613761d5bdb7131c04bd92b9834380f6",
    strip_prefix = "rules_python-4b84ad270387a7c439ebdccfd530e2339601ef27",
    urls = ["https://github.com/bazelbuild/rules_python/archive/4b84ad270387a7c439ebdccfd530e2339601ef27.tar.gz"],
)

http_archive(
    name = "zlib",
    build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
    sha256 = "629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff",
    strip_prefix = "zlib-1.2.11",
    urls = ["https://github.com/madler/zlib/archive/v1.2.11.tar.gz"],
)

#############################
# Load Robolectric repository
#############################

ROBOLECTRIC_VERSION = "4.4"

http_archive(
    name = "robolectric",
    sha256 = "d4f2eb078a51f4e534ebf5e18b6cd4646d05eae9b362ac40b93831bdf46112c7",
    strip_prefix = "robolectric-bazel-%s" % ROBOLECTRIC_VERSION,
    urls = ["https://github.com/robolectric/robolectric-bazel/archive/%s.tar.gz" % ROBOLECTRIC_VERSION],
)

load("@robolectric//bazel:robolectric.bzl", "robolectric_repositories")

robolectric_repositories()

#############################
# Load Kotlin repository
#############################

RULES_KOTLIN_TAG = "v1.8"

RULES_KOTLIN_SHA = "01293740a16e474669aba5b5a1fe3d368de5832442f164e4fbfc566815a8bc3a"

http_archive(
    name = "io_bazel_rules_kotlin",
    sha256 = RULES_KOTLIN_SHA,
    urls = ["https://github.com/bazelbuild/rules_kotlin/releases/download/%s/rules_kotlin_release.tgz" % RULES_KOTLIN_TAG],
)

load("@io_bazel_rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories", "kotlinc_version")

KOTLIN_VERSION = "1.9.0"

# Get from https://github.com/JetBrains/kotlin/releases/
KOTLINC_RELEASE_SHA = "1fc50d805f9809e92de43e91f089cc8618567c1a350faebdabf8a40c5048bee8"

kotlin_repositories(
    compiler_release = kotlinc_version(
        release = KOTLIN_VERSION,
        sha256 = KOTLINC_RELEASE_SHA,
    ),
)

load("@io_bazel_rules_kotlin//kotlin:core.bzl", "kt_register_toolchains")

kt_register_toolchains()

#############################
# Load dependencies
#############################
load("@dagger//:repositories.bzl", "dagger_repositories")

dagger_repositories()

load("@dagger//:workspace_defs.bzl", "dagger_workspace")

dagger_workspace()

load("@dagger//:workspace_defs_2.bzl", "dagger_workspace_2")

dagger_workspace_2()
