require 'httparty'
require 'json'
require_relative 'kele/roadmap.rb'

class Kele
    include HTTParty
    include Roadmap
    
    base_uri 'https://www.bloc.io/api/v1'
    
    def initialize(email, password)
        response = self.class.post(api_url("sessions"), body: { email: email, password: password })
        #binding.pry
        raise "Invalid email/password" if response.code != 200
        @auth_token = response["auth_token"]
    end
    
    def get_me
        response = self.class.get(api_url('users/me'), headers: { "authorization" => @auth_token })
        @user_data = JSON.parse(response.body)
    end

    def get_mentor_availability(mentor_id)
        response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
        @mentor_availability = JSON.parse(response.body)
    end

    def get_messages
        response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token })
        @messages = JSON.parse(response.body)
    end
    
    def create_message(email, recipient_id, subject, text)

        response = self.class.post(api_url("messages"), body: {
            "sender" => email,
            "recipient_id" => recipient_id,
            "subject" => subject,
            "stripped-text" => text
            }, headers: { "authorization" => @auth_token })
        puts response
    end

    def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
        values = {
            "assignment_branch" => assignment_branch,
            "assignment_commit_link" => assignment_commit_link,
            "checkpoint_id" => checkpoint_id,
            "comment" => comment,
            "enrollment_id" => enrollment_id
        }
        response = self.class.post(api_url("checkpoint_submissions"), body: values, headers: { "authorization" => @auth_token })
        puts response
    end
    
    def update_submission(checkpoint_submission_id, checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
        values = {
            "assignment_branch" => assignment_branch,
            "assignment_commit_link" => assignment_commit_link,
            "checkpoint_id" => checkpoint_id,
            "comment" => comment,
            "enrollment_id" => enrollment_id
        }
        response = self.class.put(api_url("checkpoint_submissions/#{checkpoint_submission_id}"), body: values, headers: { "authorization" => @auth_token })
        puts response
    end


    private
    def api_url(endpoint)
       "https://www.bloc.io/api/v1/#{endpoint}" 
    end
end
#mentor_id 2345139
#[6] pry(main)> kele_client.create_submission(2354, " "," ","Testing kele_client.create_submission",19220)
#{"id"=>143638, "status"=>"submitted", "work_commit_link"=>nil, "assignment_branch"=>" ", "assignment_commit_link"=>" "}
#=> nil