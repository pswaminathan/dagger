load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def dagger_repositories():
    maybe(
        http_archive,
        name = "google_bazel_common",
        sha256 = "60a9aebe25f476646f61c041d1679a9b21076deffbd51526838c7f24d6468ac0",
        strip_prefix = "bazel-common-227a23a508a2fab0fa67ffe2d9332ae536a40edc",
        urls = [
            "https://github.com/google/bazel-common/archive/227a23a508a2fab0fa67ffe2d9332ae536a40edc.zip",
        ],
    )

    RULES_JVM_EXTERNAL_TAG = "5.3"
    maybe(
        http_archive,
        name = "rules_jvm_external",
        sha256 = "d31e369b854322ca5098ea12c69d7175ded971435e55c18dd9dd5f29cc5249ac",
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/%s/rules_jvm_external-%s.tar.gz" % (RULES_JVM_EXTERNAL_TAG, RULES_JVM_EXTERNAL_TAG),
    )
