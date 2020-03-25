require 'send_sms/sms'

class Elevator < ApplicationRecord
    belongs_to :column
    
    after_update :send_sms, if: :is_intervention
    def send_sms()
        t = self.column.battery.building.customer.technician_full_name
        e = self.serial_number
        test = SendSms::Sms.new
        test.send_sms(t,e)
    end

    def is_intervention
        self.status == "Intervention"
    end
end
