/*
	This file is part of solidity.
	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#include "Builtin.h"
#include <memory>
#include <vector>

namespace solidity::frontend::test
{

class TestFunctionCall;

class Behaviour
{
public:
	Behaviour() = default;
	virtual ~Behaviour() = default;

	virtual void begin() {}
	virtual void before(TestFunctionCall const&, bool = false) {}
	virtual void after(TestFunctionCall const&, bool = false) {}
	virtual void end() {}

	virtual bool isValid(const TestFunctionCall&) { return true; }

	virtual void printExpectedResult(TestFunctionCall const&, std::string const&, std::ostream&) {}
	virtual void printObtainedResult(TestFunctionCall const&, std::string const&, std::ostream&) {}
	virtual void printToFile(TestFunctionCall const&, std::ostream&) {}
};

using Behaviours = std::vector<std::shared_ptr<Behaviour>>;

} // namespace solidity::frontend::test
