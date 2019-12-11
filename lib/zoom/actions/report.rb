# frozen_string_literal: true

module Zoom
  module Actions
    module Report
      def report_getaccountreport(*args)
        options = Utils.extract_options!(args)
        Utils.require_params(%i[from to], options)
        Utils.process_datetime_params!(%i[from to], options)
        Utils.parse_response self.class.post('/report/getaccountreport', query: options)
      end

      def report_getuserreport(*args)
        options = Utils.extract_options!(args)
        Utils.require_params(%i[user_id from to], options)
        Utils.process_datetime_params!(%i[from to], options)
        Utils.parse_response self.class.post('/report/getuserreport', query: options)
      end

      def report_getdailyreport(*args)
        options = Utils.extract_options!(args)
        Utils.require_params(%i[year month], options)
        Utils.parse_response self.class.post('/report/getdailyreport', query: options)
      end

      def report_getmeetingparticipants(*args)
        params = Utils.extract_options!(args)
        Utils.require_params(%i[meeting_id], params)
        Utils.parse_response self.class.post('/report/meetings/' + params["meeting_id"] + '/participants')
      end
    end
  end
end
