/**
 * @file tesseract_state_solver_python.i
 * @brief The tesseract_state_solver_python SWIG master file.
 *
 * @author John Wason
 * @date February 9, 2022
 * @version TODO
 * @bug No known bugs
 *
 * @copyright Copyright (c) 2022, Wason Technology, LLC
 *
 * @par License
 * Software License Agreement (Apache License)
 * @par
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * @par
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

%module(directors="1", package="tesseract_robotics.tesseract_state_solver") tesseract_state_solver_python

#pragma SWIG nowarn=473

%include "tesseract_swig_include.i"

//%import "tesseract_common_python.i"
//%import "tesseract_geometry_python.i"
%import "tesseract_scene_graph_python.i"
%import "tesseract_srdf_python.i"

%{

#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/directed_graph.hpp>
#include <boost/graph/properties.hpp>
#include <boost/graph/depth_first_search.hpp>
#include <boost/graph/breadth_first_search.hpp>

#include <tesseract_common/status_code.h>
#include <tesseract_geometry/geometries.h>
#include <tesseract_common/resource_locator.h>
#include <tesseract_srdf/kinematics_information.h>

// tesseract_state_solver
#include <tesseract_state_solver/mutable_state_solver.h>
#include <tesseract_state_solver/state_solver.h>
#include <tesseract_state_solver/kdl/kdl_state_solver.h>
#include <tesseract_state_solver/ofkt/ofkt_state_solver.h>

%}

// tesseract_state_solver
#define TESSERACT_STATE_SOLVER_CORE_PUBLIC

namespace tesseract_scene_graph
{
    class KDLTreeData;
}

%ignore KDLStateSolver(const tesseract_scene_graph::SceneGraph& scene_graph, tesseract_scene_graph::KDLTreeData data);

%shared_ptr(tesseract_scene_graph::StateSolver)
%wrap_unique_ptr(StateSolverUPtr,tesseract_scene_graph::StateSolver)
%include "tesseract_state_solver/state_solver.h"

%shared_ptr(tesseract_scene_graph::MutableStateSolver)
%wrap_unique_ptr(MutableStateSolverUPtr,tesseract_scene_graph::MutableStateSolver)
%include "tesseract_state_solver/mutable_state_solver.h"

%shared_ptr(tesseract_scene_graph::KDLStateSolver)
%include "tesseract_state_solver/kdl/kdl_state_solver.h"

%shared_ptr(tesseract_scene_graph::OFKTStateSolver)
%include "tesseract_state_solver/ofkt/ofkt_state_solver.h"


