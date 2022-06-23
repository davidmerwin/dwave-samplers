# Copyright 2020 D-Wave Systems Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from libcpp.vector cimport vector


cdef extern from "tabu_search.h" nogil:
    cdef cppclass TabuSearch:
        TabuSearch(vector[vector[double]] Q,
                   const vector[int] initSol,
                   int tenure,
                   long int timeout,
                   int numRestarts,
                   unsigned int seed,
                   double energyThreshold,
		   int coeffZFirst,
		   int coeffZRestart,
		   int lowerBoundZ) except +
        double bestEnergy()
        vector[int] bestSolution()
        int numRestarts()
