import { combineReducers } from 'redux'

import { ADD_RECORD, EDIT_RECORD, DEL_RECORD } from '../actions/recordActions'

const initialState = {
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

const records = (state = initialState.records, action) => {
  switch (action.type) {
    case ADD_RECORD:
      return [
        ...state,
        action.record
      ]
    case DEL_RECORD:
      return state.filter(({ id }) => id !== action.id)
    default:
      return state
  }
}

export default combineReducers({ records })
