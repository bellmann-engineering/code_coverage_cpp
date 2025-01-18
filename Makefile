# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -fprofile-arcs -ftest-coverage
LDFLAGS = -lgtest -lgtest_main -lpthread

# Directories
SRC_DIR = src
BUILD_DIR = build

# Source files
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRC))

# Targets
TEST_EXEC = $(BUILD_DIR)/calculator_test

# Default target
all: $(TEST_EXEC)

# Build the test executable
$(TEST_EXEC): $(OBJ)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run tests
test: $(TEST_EXEC)
	$(TEST_EXEC)

# Generate coverage report
coverage: test
	gcov -o $(BUILD_DIR) $(SRC_DIR)/*.cpp

# Clean build directory
clean:
	rm -rf $(BUILD_DIR) *.gcda *.gcno *.gcov
