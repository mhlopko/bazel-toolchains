# Copyright 2016 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Once recursive workspace is implemented in Bazel, this file should cease
# to exist.

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    """Download dependencies of bazel-toolchains."""
    excludes = native.existing_rules().keys()

    if "io_bazel_rules_docker" not in excludes:
        http_archive(
            name = "io_bazel_rules_docker",
            sha256 = "b1fb58b32f4bf26fc64313c6d1d5dc415579be0eb3411e8845df72c699958fc1",
            strip_prefix = "rules_docker-090f1e6214dcfa34a48b1440c97df4e9721fb921",
            urls = ["https://github.com/bazelbuild/rules_docker/archive/090f1e6214dcfa34a48b1440c97df4e9721fb921.tar.gz"],
        )

    # io_bazel_rules_go is the dependency of container_test rules.
    if "io_bazel_rules_go" not in excludes:
        http_archive(
            name = "io_bazel_rules_go",
            sha256 = "4b14d8dd31c6dbaf3ff871adcd03f28c3274e42abc855cb8fb4d01233c0154dc",
            urls = ["https://github.com/bazelbuild/rules_go/releases/download/0.10.1/rules_go-0.10.1.tar.gz"],
        )

    if "base_images_docker" not in excludes:
        http_archive(
            name = "base_images_docker",
            sha256 = "182572f7a2c3a34879e8e3f66e5f9ad829cc620bf2c8e6e18c384aae3cd11863",
            strip_prefix = "base-images-docker-5530512a9e27f4dd76848a6b40ce2b2b23a87ece",
            urls = ["https://github.com/GoogleCloudPlatform/base-images-docker/archive/5530512a9e27f4dd76848a6b40ce2b2b23a87ece.tar.gz"],
        )

    if "distroless" not in excludes:
        http_archive(
            name = "distroless",
            sha256 = "44c5d3370df6983ef53cfc2347447c6595fea2d1951a1645660baf67657b8e23",
            strip_prefix = "distroless-94b5126dbe06c2cb4dc74f7c9bfe6394b8e6e44c",
            urls = ["https://github.com/GoogleCloudPlatform/distroless/archive/94b5126dbe06c2cb4dc74f7c9bfe6394b8e6e44c.tar.gz"],
        )

    # Bazel gpg key necessary to install Bazel in the containers.
    if "bazel_gpg" not in excludes:
        native.http_file(
            name = "bazel_gpg",
            sha256 = "30af2ca7abfb65987cd61802ca6e352aadc6129dfb5bfc9c81f16617bc3a4416",
            url = "https://bazel.build/bazel-release.pub.gpg",
        )
