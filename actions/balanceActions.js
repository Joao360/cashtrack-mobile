export const SET_BALANCE = 'SET_BALANCE'
export const ADD_INCOME = 'ADD_INCOME'
export const ADD_EXPENSE = 'ADD_EXPENSE'

export const setBalance = value => (
  { type: SET_BALANCE, value}
)

export const addIncome = value => (
  { type: ADD_INCOME, value}
)

export const addExpense = value => (
  { type: ADD_EXPENSE, value}
)