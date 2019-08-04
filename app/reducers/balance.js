import { ADD_EXPENSE, ADD_INCOME, SET_BALANCE } from '../actions/balanceActions'

const balance = (state = 0, action) => {
  switch (action.type) {
  case SET_BALANCE:
    return action.value
  case ADD_INCOME:
    return state.balance + action.value
  case ADD_EXPENSE:
    return state.balance - action.value
  default:
    return state
  }
}

export default balance
