module GolfSwitch
  class  CourseImage
    attr_accessor :img,:img_base

    def initialize(img,img_base="//devxml.golfswitch.com/img/course")
      @img = img
    end

    def image_url(img_base="//devxml.golfswitch.com/img/course",protocol="https")
       if @img
        "#{protocol}://#{img_base.to_s}/#{self.id}/#{img.to_s}"
      else
         ""
      end
    end
  end
end