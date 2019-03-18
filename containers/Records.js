import { connect } from 'react-redux'

import RecordList from '../components/RecordList'

const mapStateToProps = state => {
  const { records: { records } } = state

  return { records }
}

export default connect(mapStateToProps)(RecordList)
