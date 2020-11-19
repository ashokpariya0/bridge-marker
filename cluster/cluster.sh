# Copyright 2018-2019 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export KUBEVIRT_PROVIDER=${KUBEVIRT_PROVIDER:-'k8s-1.19'}
export KUBEVIRTCI_TAG="2011121336-c2cf403"

# The CLUSTER_PATH var is used in cluster folder and points to the _kubevirtci where the cluster is deployed from.
CLUSTER_PATH=${CLUSTER_PATH:-"${PWD}/_kubevirtci/"}

function cluster::install() {
    if [ ! -d ${CLUSTER_PATH} ]; then
        git clone https://github.com/kubevirt/kubevirtci.git ${CLUSTER_PATH}
        (
            cd ${CLUSTER_PATH}
            git checkout ${KUBEVIRTCI_TAG}
        )
    fi
}

function cluster::path() {
    echo -n ${CLUSTER_PATH}
}

function cluster::kubeconfig() {
    echo -n ${CLUSTER_PATH}/_ci-configs/${KUBEVIRT_PROVIDER}/.kubeconfig
}
