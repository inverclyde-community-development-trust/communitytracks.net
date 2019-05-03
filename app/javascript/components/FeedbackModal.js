import React, { Component } from 'react'
import {
  Button,
  Modal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Form,
  FormGroup,
  Label,
  Input,
  Alert
} from 'reactstrap'
import fetch from 'cross-fetch';

export default class FeedbackModal extends Component {
  state = {
    submitting: false,
    submitted: false,
    error: null
  }

  submit = event => {
    event.preventDefault()

    const elements = event.target.elements
    const email = elements.email.value
    const text = elements.text.value

    if (
      email == null ||
      email.length === 0 ||
      text == null ||
      text.length === 0
    ) {
      this.setState({ error: 'All fields must be filled in' })
      return
    }

    const { selectedFeature } = this.props

    this.setState({ submitting: true })
    fetch('/map_feedback', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({
        text,
        email,
        map_layer_id: selectedFeature.layerId,
        route_name: selectedFeature.kmlEvent.featureData.name
      })
    })
      .then(result => {
        console.log('Result', result)
        this.setState({ submitting: false })
        if (!result.ok) {
          this.setState({ error: 'Error submitting', submitted: false })
          return
        }

        this.setState({ submitted: true })
      })
      .catch(err => {
        console.error('Err', err)
        this.setState({
          submitting: false,
          submitted: false,
          error: 'Error submitting'
        })
      })
  }

  renderFeedbackForm = () => {
    return (
      <Form id="feedbackForm" onSubmit={this.submit}>
        <FormGroup>
          <Label for="email">Email</Label>
          <Input
            name="email"
            type="email"
            id="email"
            placeholder="your@email.com"
            required
          />
        </FormGroup>
        <FormGroup>
          <Label for="text">Feedback</Label>
          <Input name="text" type="textarea" id="text" required />
        </FormGroup>
      </Form>
    )
  }

  render() {
    const { onClose, selectedFeature, visible } = this.props
    const { error, submitted, submitting } = this.state

    if (!visible) {
      return null
    }

    return (
      <Modal isOpen={visible} toggle={onClose}>
        <ModalHeader toggle={onClose}>
          Feedback: {selectedFeature.kmlEvent.featureData.name}
        </ModalHeader>
        <ModalBody>
          <span
            dangerouslySetInnerHTML={{
              __html: selectedFeature.kmlEvent.featureData.description
            }}
          />
          <hr />
          {error && <Alert color="danger">{error}</Alert>}
          {submitted ? (
            <Alert color="success">
              <h4 className="alert-heading">Feedback submitted!</h4>
              <p>Thanks, we'll get back to you as soon as possible.</p>
            </Alert>
          ) : (
            this.renderFeedbackForm()
          )}
        </ModalBody>
        <ModalFooter>
          {!submitted && (
            <React.Fragment>
              <Button disabled={submitting} form="feedbackForm" color="primary">
                {submitting && <i className="fal fa-spinner-third fa-spin" />}
                Submit
              </Button>
              <Button disabled={submitting} color="secondary" onClick={onClose}>
                Cancel
              </Button>
            </React.Fragment>
          )}
          {submitted && (
            <Button color="primary" onClick={onClose}>
              Done
            </Button>
          )}
        </ModalFooter>
      </Modal>
    )
  }
}
