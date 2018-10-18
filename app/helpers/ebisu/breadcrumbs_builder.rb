module Ebisu
  class BreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
    def render
      @context.render "/ebisu/shared/breadcrumbs", elements: @elements
    end
  end
end
