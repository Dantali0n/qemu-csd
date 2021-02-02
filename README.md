[![pipeline status](https://gitlab.dantalion.nl:4443/vrije-universiteit-vu-/qemu-csd/badges/master/pipeline.svg)](https://gitlab.dantalion.nl:4443/vrije-universiteit-vu-/qemu-csd/commits/master)
[![coverage report](https://gitlab.dantalion.nl:4443/vrije-universiteit-vu-/qemu-csd/badges/master/coverage.svg)](https://gitlab.dantalion.nl:4443/vrije-universiteit-vu-/qemu-csd/commits/master)
# QEMU-CSD



### Project goals

* Perform read / write requests on ZNS SSD in QEMU.
* Setup Github repository and bi-directional mirroring.
* Read paper.

### Directory structure

* qemucsd - project source files
* cmake - small cmake snippets to enable various features
* dependencies - project dependencies
* docs - doxygen generated source code documentation
* documentation - project documentation written in LaTeX
[comment]: <> (* lib - support library with functions and definitions)
* playground - small toy examples or other experiments
* [python](python/README.md) - python scripts to aid in visualization or measurements
* tests - unit tests and possibly integration tests

### Modules

| Module     | Optional | Task                                               |
|------------|----------|----------------------------------------------------|
| arguments  | Yes      | Parse commandline arguments to relevant components |
| entry      | No       | Entry function from main                           |

#### Dependencies

This project requires quite some dependencies, the
majority will be compiled by the project itself and installed
into the build directory. Anything that is not automatically
compiled and linked is shown below.

* General
    * compiler with c++17 support
    * cmake 3.13 or higher
* Windows specific
    * Visual Studio 2019 community
    * cygwin
* Documentation
    * doxygen
    * LaTeX
* Code Coverage
    * ctest
    * lcov
    * gcov
* Continuous Integration
    * valgrind
* Python scripts
    * python 3.x
    * virtualenv
    
The following dependencies are automatically compiled. all dependencies will be
statically linked given the nature of the project and the expected size of dependencies:

| Dependency                                                         | Version     |
|--------------------------------------------------------------------|-------------|
| [backward](https://github.com/bombela/backward-cpp)                | 1.5         |
| [booost](https://www.boost.org/)                                   | 1.74.0      |

#### Setup

Building tools and dependencies is done by simply executing the following commands
from the root directory.

```shell script
git submodule update --init --recursive
mkdir build
cd build
cmake ..
cmake --build .
cmake ..
source qemu-csd/activate.sh
# run commands and tools as you please
deactivate
```

Additionally, any python based tools and graphs are generated by execution these
additional commands from the root directory. Ensure the previous environment has
been deactivated.

```shell script
virtualenv -p python3 python
cd python
source bin/activate
pip install -r requirements.txt
```

#### Licensing

Some files are licensed under a variety of different licenses please see
specific source files for licensing details.

#### References

* [Getting started with ZNS in QEMU](https://www.snia.org/educational-library/getting-started-nvme-zns-qemu-2020)

#### Ideas

#### Snippets
