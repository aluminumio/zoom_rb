# frozen_string_literal: true
require 'pry'

module Zoom
  module Actions
    module Room
      def room_restart(*args)
        # TODO: implement room_restart
        # https://api.zoom.us/v2/rooms/{roomId}/zrclient
        # options = Utils.extract_options!(args)
        raise Zoom::NotImplemented, 'room_restart is not yet implemented'
      end

      def room_list(*args)
        params = Zoom::Params.new(Utils.extract_options!(args))
        params.permit(%i[status page_size page_number])
        response = self.class.post('/rooms/zrlist', body: { jsonrpc: "2.0", method: 'list' }.to_json, query: { access_token: access_token })
        Utils.parse_response(response)
      end

      def room_leave(*args)
        params = Zoom::Params.new(Utils.extract_options!(args))
        params.require(%i[room_id]).permit(%i[status page_size page_number])
        response = self.class.post("/rooms/#{params[:room_id]}/meetings", 
          body: { jsonrpc: "2.0", method: 'leave' }.to_json, 
          query: { access_token: access_token })
        Utils.parse_response(response)     
      end

      def room_join(*args)
        params = Zoom::Params.new(Utils.extract_options!(args))
        params.require(%i[room_id meeting_id]).permit(%i[status page_size page_number force])
        response = self.class.post("/rooms/#{params[:room_id]}/meetings", 
          body: { jsonrpc: "2.0", method: 'join', params: { meeting_number: params[:meeting_id], force_accept: params[:force] || false } }.to_json, 
          query: { access_token: access_token })
        Utils.parse_response(response)         
      end

      def room_invite(*args)
        params = Zoom::Params.new(Utils.extract_options!(args))
        params.require(%i[room_id callee]).permit(%i[status page_size page_number])
        response = self.class.post("/rooms/#{params[:room_id]}/meetings", 
          body: { jsonrpc: "2.0", method: 'invite', params: { callee: params[:callee] } }.to_json, 
          query: { access_token: access_token })
        Utils.parse_response(response)         
      end

      def room_schedule(*args)
        # TODO: implement room_schedule
        # https://api.zoom.us/v2/rooms/{roomId}/meetings # method=schedule
        # options = Utils.extract_options!(args)
        raise Zoom::NotImplemented, 'room_schedule is not yet implemented'
      end

      def room_cancel(*args)
        # TODO: implement room_cancel
        # https://api.zoom.us/v2/rooms/{roomId}/meetings # method=cancel
        # options = Utils.extract_options!(args)
        raise Zoom::NotImplemented, 'room_cancel is not yet implemented'
      end

      def room_end(*args)
        # TODO: implement room_end
        # https://api.zoom.us/v2/rooms/{roomId}/meetings # method=end
        # options = Utils.extract_options!(args)
        raise Zoom::NotImplemented, 'room_end is not yet implemented'
      end
    end
  end
end
  