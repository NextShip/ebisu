module Ebisu
  class BreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
    def render
      @context.render "/shared/ebisu/breadcrumbs", elements: @elements
    end
  end
end
