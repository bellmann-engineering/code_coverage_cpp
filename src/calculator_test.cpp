#include "calculator.cpp"
#include <gtest/gtest.h>

TEST(CalculatorTest, AddWorks) {
    Calculator calc;
    EXPECT_EQ(calc.Add(2, 3), 5);
}

// TEST(CalculatorTest, MutliWorks) {
//     Calculator calc;
//     EXPECT_EQ(calc.Multiply(2, 3), 6);
// }

TEST(CalculatorTest, SubtractWorks) {
    Calculator calc;
    EXPECT_EQ(calc.Subtract(5, 3), 2);
}

TEST(CalculatorTest, DivideWorks) {
    Calculator calc;
    EXPECT_EQ(calc.Divide(6, 2), 3);
}

TEST(CalculatorTest, DivisionByZeroThrows) {
    Calculator calc;
    EXPECT_THROW(calc.Divide(10, 0), std::invalid_argument);
}

// Note: No test for Multiply or some branches of Divide

int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
