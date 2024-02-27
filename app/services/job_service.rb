# frozen_string_literal: true

class JobService
  def initialize(resource, message_subject)
    @resource = resource
    @message_subject = message_subject
  end

  def call
    feedback(@resource, @message_subject)
  end

  def feedback(resource, message_subject)
    if resource.persisted?
      {
        status: { 
          code: 200,
          message: "#{message_subject} was created successfully."
        }
      }
    else
      {
        status: {
          code: 422,
          message: "#{message_subject} couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"
        }
      }
    end
  end
end
