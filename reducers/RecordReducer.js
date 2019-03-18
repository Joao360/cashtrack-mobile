import { combineReducers } from 'redux'

const INITIAL_STATE = {
  records: [
    {
      id: 1,
      recordType: 'Expense',
      ammount: 20
    },
    {
      id: 2,
      recordType: 'Income',
      ammount: 5
    },
    {
      id: 3,
      recordType: 'Income',
      ammount: 200
    }
  ]
}

const records = (state = INITIAL_STATE, action) => {
  switch (action.type) {
    default:
      return state
  }
}

export default combineReducers({
  records
})
