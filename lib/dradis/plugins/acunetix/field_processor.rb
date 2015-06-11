module Dradis::Plugins::Acunetix
  # This processor defers to ::Acunetix::Scan for the scan template and to
  # ::Acunetix::ReportItem for the report_item and evidence templates.
  class FieldProcessor < Dradis::Plugins::Upload::FieldProcessor

    def post_initialize(args={})
      if data.name == "Scan"
        @acunetix_object = ::Acunetix::Scan.new(data)
      else
        @acunetix_object = ::Acunetix::ReportItem.new(data)
      end
    end

    def value(args={})
      field = args[:field]

      # fields in the template are of the form <foo>.<field>, where <foo>
      # is common across all fields for a given template (and meaningless).
      _, name = field.split('.')

      @acunetix_object.try(name) || 'n/a'
    end
  end

end
