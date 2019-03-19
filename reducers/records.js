import { ADD_RECORD, EDIT_RECORD, DEL_RECORD } from '../actions/recordActions'

const records = (state = [], action) => {
  switch (action.type) {
    case ADD_RECORD:
      return [
        ...state,
        action.record
      ]
    case EDIT_RECORD:
      return state.map((record) => {
        if (record.id === action.record.id) return action.record
        return record
      })
    case DEL_RECORD:
      return state.filter(({ id }) => id !== action.id)
    default:
      return state
  }
}

export default records
