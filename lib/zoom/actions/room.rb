# frozen_string_literal: true

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
          response = self.class.get('/rooms/zrlist', query: params.merge(access_token: access_token))
          Utils.parse_response(response)
        end

        def room_leave(*args)
            # TODO: implement room_leave
            # https://api.zoom.us/v2/rooms/{roomId}/meetings # method=leave
            # options = Utils.extract_options!(args)
            raise Zoom::NotImplemented, 'room_leave is not yet implemented'
        end

        def room_join(*args)
            # TODO: implement room_join
            # https://api.zoom.us/v2/rooms/{roomId}/meetings # method=join
            # Appears to have a zoom room join another meeting...may be useful
            # options = Utils.extract_options!(args)
            raise Zoom::NotImplemented, 'room_join is not yet implemented'
        end

        def room_invite(*args)
            # TODO: implement room_invite
            # https://api.zoom.us/v2/rooms/{roomId}/meetings # method=invite
            # May be useful for auto-joining a meeting with the zoom client
            # options = Utils.extract_options!(args)
            raise Zoom::NotImplemented, 'room_invite is not yet implemented'
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
  