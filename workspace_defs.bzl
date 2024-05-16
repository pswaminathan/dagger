# Copyright (C) 2020 The Google Bazel Common Authors.
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

"""A macro to configure Dagger deps within a workspace"""

load("@dagger//:build_defs.bzl", "POM_VERSION")
load("@dagger//third_party/google_bazel_common:workspace_defs.bzl", "google_common_workspace_rules")
load("@rules_jvm_external//:defs.bzl", "maven_install")

def dagger_workspace():
    google_common_workspace_rules()
    maven_install(
        artifacts = DAGGER_MAVEN_DEPS,
        name = "dagger_maven",
        repositories = [
            "https://repo1.maven.org/maven2",
            "https://maven.google.com",
        ],
        maven_install_json = "@dagger//:dagger_maven_install.json",
        version_conflict_policy = "pinned",
    )

ANDROID_LINT_VERSION = "30.1.0"

AUTO_COMMON_VERSION = "1.2.1"

# NOTE(bcorso): Even though we set the version here, our Guava version in
#  processor code will use whatever version is built into JavaBuilder, which is
#  tied to the version of Bazel we're using.
GUAVA_VERSION = "27.1"

GRPC_VERSION = "1.2.0"

INCAP_VERSION = "0.2"

BYTE_BUDDY_VERSION = "1.9.10"

CHECKER_FRAMEWORK_VERSION = "2.5.3"

ERROR_PRONE_VERSION = "2.14.0"

KOTLIN_VERSION = "1.9.0"

KSP_VERSION = KOTLIN_VERSION + "-1.0.12"

DAGGER_MAVEN_DEPS = [
    "androidx.activity:activity-ktx:1.7.1",
    "androidx.annotation:annotation:1.5.0",
    "androidx.appcompat:appcompat:1.6.1",
    "androidx.core:core-ktx:1.9.0",
    "androidx.fragment:fragment-ktx:1.5.4",
    "androidx.lifecycle:lifecycle-common:2.6.1",
    "androidx.lifecycle:lifecycle-livedata-ktx:2.6.1",
    "androidx.lifecycle:lifecycle-runtime:2.6.1",
    "androidx.lifecycle:lifecycle-runtime-ktx:2.6.1",
    "androidx.lifecycle:lifecycle-viewmodel:2.6.1",
    "androidx.lifecycle:lifecycle-viewmodel-savedstate:2.6.1",
    "androidx.multidex:multidex:2.0.1",
    "androidx.navigation:navigation-common:2.5.3",
    "androidx.navigation:navigation-fragment:2.5.3",
    "androidx.navigation:navigation-runtime:2.5.3",
    "androidx.savedstate:savedstate:1.2.1",
    "androidx.test:monitor:1.4.0",
    "androidx.test:core:1.4.0",
    "androidx.test.ext:junit:1.1.3",
    "com.android.support:appcompat-v7:25.0.0",
    "com.android.support:support-annotations:25.0.0",
    "com.android.support:support-fragment:25.0.0",
    "com.android.tools.external.org-jetbrains:uast:%s" % ANDROID_LINT_VERSION,
    "com.android.tools.external.com-intellij:intellij-core:%s" % ANDROID_LINT_VERSION,
    "com.android.tools.external.com-intellij:kotlin-compiler:%s" % ANDROID_LINT_VERSION,
    "com.android.tools.lint:lint:%s" % ANDROID_LINT_VERSION,
    "com.android.tools.lint:lint-api:%s" % ANDROID_LINT_VERSION,
    "com.android.tools.lint:lint-checks:%s" % ANDROID_LINT_VERSION,
    "com.android.tools.lint:lint-tests:%s" % ANDROID_LINT_VERSION,
    "com.android.tools:testutils:%s" % ANDROID_LINT_VERSION,
    "com.google.auto:auto-common:%s" % AUTO_COMMON_VERSION,
    "com.google.auto.factory:auto-factory:1.0",
    "com.google.auto.service:auto-service:1.0",
    "com.google.auto.service:auto-service-annotations:1.0",
    "com.google.auto.value:auto-value:1.9",
    "com.google.auto.value:auto-value-annotations:1.9",
    "com.google.code.findbugs:jsr305:3.0.1",
    "com.google.devtools.ksp:symbol-processing:%s" % KSP_VERSION,
    "com.google.devtools.ksp:symbol-processing-api:%s" % KSP_VERSION,
    "com.google.errorprone:error_prone_annotation:%s" % ERROR_PRONE_VERSION,
    "com.google.errorprone:error_prone_annotations:%s" % ERROR_PRONE_VERSION,
    "com.google.errorprone:error_prone_check_api:%s" % ERROR_PRONE_VERSION,
    "com.google.googlejavaformat:google-java-format:1.5",
    "com.google.guava:guava:%s-jre" % GUAVA_VERSION,
    "com.google.guava:guava-testlib:%s-jre" % GUAVA_VERSION,
    "com.google.guava:failureaccess:1.0.1",
    "com.google.guava:guava-beta-checker:1.0",
    "com.google.protobuf:protobuf-java:3.7.0",
    "com.google.testing.compile:compile-testing:0.18",
    "com.google.truth:truth:1.1",
    "com.squareup:javapoet:1.13.0",
    "com.squareup:kotlinpoet:1.11.0",
    "io.github.java-diff-utils:java-diff-utils:4.11",
    "io.grpc:grpc-context:%s" % GRPC_VERSION,
    "io.grpc:grpc-core:%s" % GRPC_VERSION,
    "io.grpc:grpc-netty:%s" % GRPC_VERSION,
    "io.grpc:grpc-protobuf:%s" % GRPC_VERSION,
    "jakarta.inject:jakarta.inject-api:2.0.1",
    "javax.annotation:javax.annotation-api:1.3.2",
    "javax.inject:javax.inject:1",
    "javax.inject:javax.inject-tck:1",
    "junit:junit:4.13",
    "net.bytebuddy:byte-buddy:%s" % BYTE_BUDDY_VERSION,
    "net.bytebuddy:byte-buddy-agent:%s" % BYTE_BUDDY_VERSION,
    "net.ltgt.gradle.incap:incap:%s" % INCAP_VERSION,
    "net.ltgt.gradle.incap:incap-processor:%s" % INCAP_VERSION,
    "org.checkerframework:checker-compat-qual:%s" % CHECKER_FRAMEWORK_VERSION,
    "org.checkerframework:dataflow:%s" % CHECKER_FRAMEWORK_VERSION,
    "org.checkerframework:javacutil:%s" % CHECKER_FRAMEWORK_VERSION,
    "org.hamcrest:hamcrest-core:1.3",
    "org.jetbrains.kotlin:kotlin-annotation-processing-embeddable:%s" % KOTLIN_VERSION,
    "org.jetbrains.kotlin:kotlin-compiler-embeddable:%s" % KOTLIN_VERSION,
    "org.jetbrains.kotlin:kotlin-daemon-embeddable:%s" % KOTLIN_VERSION,
    "org.jetbrains.kotlin:kotlin-stdlib:%s" % KOTLIN_VERSION,
    "org.jetbrains.kotlinx:kotlinx-metadata-jvm:0.6.2",
    "org.jspecify:jspecify:0.3.0",
    "org.mockito:mockito-core:2.28.2",
    "org.objenesis:objenesis:1.0",
    "org.robolectric:robolectric:4.4",
    "org.robolectric:shadows-framework:4.4",  # For ActivityController
]

# For tagged releases, the POM_VERSION will be set to the version of the release.
# However, for CI testing the POM_VERSION will not be set, so we use the
# HEAD-SNAPSHOT artifacts instead.
# TODO(bcorso): Ideally, we would use the LOCAL-SNAPSHOT artifacts for CI testing;
# however, maven_install doesn't work with local maven repositories
# (See issue: https://github.com/bazelbuild/rules_jvm_external/issues/305).
_VERSION = POM_VERSION if POM_VERSION != "${project.version}" else "HEAD-SNAPSHOT"

DAGGER_ARTIFACTS = [
    #    "com.google.dagger:dagger:" + _VERSION,
    #    "com.google.dagger:dagger-compiler:" + _VERSION,
    #    "com.google.dagger:dagger-producers:" + _VERSION,
    #    "com.google.dagger:dagger-spi:" + _VERSION,
]

DAGGER_ANDROID_ARTIFACTS = [
    "com.google.dagger:dagger-android-processor:" + _VERSION,
    "com.google.dagger:dagger-android-support:" + _VERSION,
    "com.google.dagger:dagger-android:" + _VERSION,
]

HILT_ANDROID_ARTIFACTS = [
    #    "androidx.test:core:1.1.0",  # Export for ApplicationProvider
    #    "javax.annotation:javax.annotation-api:1.3.2",  # Export for @Generated
    #    "androidx.annotation:annotation:1.1.0",  # Export for @CallSuper/@Nullable
    #    "com.google.dagger:dagger:" + _VERSION,
    #    "com.google.dagger:dagger-compiler:" + _VERSION,
    #    "com.google.dagger:hilt-android:" + _VERSION,
    #    "com.google.dagger:hilt-android-testing:" + _VERSION,
    #    "com.google.dagger:hilt-android-compiler:" + _VERSION,
    #    "com.google.dagger:hilt-core:" + _VERSION,
]

DAGGER_REPOSITORIES = [
    "https://maven.google.com",
    "https://repo1.maven.org/maven2",
    "https://oss.sonatype.org/content/repositories/snapshots",
]

DAGGER_ANDROID_REPOSITORIES = DAGGER_REPOSITORIES

HILT_ANDROID_REPOSITORIES = DAGGER_REPOSITORIES

# https://github.com/bazelbuild/buildtools/blob/master/WARNINGS.md#unnamed-macro
# buildifier: disable=unnamed-macro
def dagger_rules(repo_name = "@dagger_maven"):
    """Defines the Dagger targets with proper exported dependencies and plugins.

    The targets will be of the form ":<artifact-id>".

    Args:
      repo_name: The name of the dependency repository (default is "@maven").
    """
    native.java_library(
        name = "dagger",
        exported_plugins = [":dagger-compiler"],
        visibility = ["//visibility:public"],
        exports = [
            "%s//:com_google_dagger_dagger" % repo_name,
            "%s//:javax_inject_javax_inject" % repo_name,
        ],
    )

    native.java_plugin(
        name = "dagger-compiler",
        generates_api = 1,
        processor_class = "dagger.internal.codegen.ComponentProcessor",
        deps = [
            "%s//:com_google_dagger_dagger_compiler" % repo_name,
        ],
    )

    native.java_library(
        name = "dagger-producers",
        visibility = ["//visibility:public"],
        exports = [
            ":dagger",
            "%s//:com_google_dagger_dagger_producers" % repo_name,
        ],
    )

    native.java_library(
        name = "dagger-spi",
        visibility = ["//visibility:public"],
        exports = [
            "%s//:com_google_dagger_dagger_spi" % repo_name,
        ],
    )

# https://github.com/bazelbuild/buildtools/blob/master/WARNINGS.md#unnamed-macro
# buildifier: disable=unnamed-macro
def dagger_android_rules(repo_name = "@dagger_maven"):
    """Defines the Dagger Android targets with proper exported dependencies and plugins.

    The targets will be of the form ":<artifact-id>".

    Args:
      repo_name: The name of the dependency repository (default is "@maven").
    """

    # https://github.com/bazelbuild/buildtools/blob/master/WARNINGS.md#native-android
    # buildifier: disable=native-android
    native.android_library(
        name = "dagger-android",
        exported_plugins = [":dagger-android-processor"],
        visibility = ["//visibility:public"],
        exports = [
            "%s//:com_google_dagger_dagger_android" % repo_name,
        ],
    )

    # https://github.com/bazelbuild/buildtools/blob/master/WARNINGS.md#native-android
    # buildifier: disable=native-android
    native.android_library(
        name = "dagger-android-support",
        exported_plugins = [":dagger-android-processor"],
        visibility = ["//visibility:public"],
        exports = [
            ":dagger-android",
            "%s//:com_google_dagger_dagger_android_support" % repo_name,
        ],
    )

    native.java_plugin(
        name = "dagger-android-processor",
        generates_api = 1,
        processor_class = "dagger.android.processor.AndroidProcessor",
        deps = [
            "%s//:com_google_dagger_dagger_android_processor" % repo_name,
        ],
    )

# https://github.com/bazelbuild/buildtools/blob/master/WARNINGS.md#unnamed-macro
# buildifier: disable=unnamed-macro
def hilt_android_rules(repo_name = "@dagger_maven"):
    """Defines the Hilt Android targets with proper exported dependencies and plugins.

    The targets will be of the form ":<artifact-id>".

    Args:
      repo_name: The name of the dependency repository (default is "@maven").
    """

    # https://github.com/bazelbuild/buildtools/blob/master/WARNINGS.md#native-android
    # buildifier: disable=native-android
    native.android_library(
        name = "hilt-android",
        exported_plugins = [
            ":hilt_dagger_compiler",
            ":hilt_android_entry_point_processor",
            ":hilt_aggregated_deps_processor",
            ":hilt_alias_of_processor",
            ":hilt_define_component_processor",
            ":hilt_early_entry_points_processor",
            ":hilt_generates_root_input_processor",
            ":hilt_originating_element_processor",
            ":hilt_root_processor",
            ":hilt_component_tree_deps_processor",
            ":hilt_view_model_processor",
        ],
        visibility = ["//visibility:public"],
        exports = [
            "@dagger//:dagger_with_compiler",
            "@dagger//java/dagger/hilt:artifact-core-lib",
            "@dagger//java/dagger/hilt/android:artifact-lib",
            "%s//:androidx_annotation_annotation" % repo_name,  # For @CallSuper
            "%s//:javax_annotation_javax_annotation_api" % repo_name,  # For @Generated
            "%s//:javax_inject_javax_inject" % repo_name,  # For @Inject
        ],
    )

    # This target is same as dagger-compiler, but we're redefining it here
    # so that users don't have to call dagger_rules() first.
    native.java_plugin(
        name = "hilt_dagger_compiler",
        generates_api = 1,
        processor_class = "dagger.internal.codegen.ComponentProcessor",
        deps = [
            "@dagger//:dagger_with_compiler",
        ],
    )

    native.java_plugin(
        name = "hilt_android_entry_point_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.android.processor.internal.androidentrypoint.AndroidEntryPointProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_aggregated_deps_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.aggregateddeps.AggregatedDepsProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_alias_of_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.aliasof.AliasOfProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_define_component_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.definecomponent.DefineComponentProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_early_entry_points_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.earlyentrypoint.EarlyEntryPointProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_generates_root_input_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.generatesrootinput.GeneratesRootInputProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_originating_element_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.originatingelement.OriginatingElementProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_root_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.root.RootProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_component_tree_deps_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.root.ComponentTreeDepsProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_view_model_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.android.processor.internal.viewmodel.ViewModelProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    # https://github.com/bazelbuild/buildtools/blob/master/WARNINGS.md#native-android
    # buildifier: disable=native-android
    native.android_library(
        name = "hilt-android-testing",
        testonly = 1,
        exported_plugins = [
            ":hilt_bind_value_processor",
            ":hilt_custom_test_application_processor",
            ":hilt_uninstall_modules_processor",
        ],
        visibility = ["//visibility:public"],
        exports = [
            ":hilt-android",
            "@dagger//java/dagger/hilt/android/testing:artifact-lib",
            "%s//:androidx_test_core" % repo_name,  # For ApplicationProvider
        ],
    )

    native.java_plugin(
        name = "hilt_bind_value_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.android.processor.internal.bindvalue.BindValueProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_custom_test_application_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.android.processor.internal.customtestapplication.CustomTestApplicationProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )

    native.java_plugin(
        name = "hilt_uninstall_modules_processor",
        generates_api = 1,
        processor_class = "dagger.hilt.processor.internal.uninstallmodules.UninstallModulesProcessor",
        deps = ["@dagger//java/dagger/hilt/android/processor:artifact-lib"],
    )
