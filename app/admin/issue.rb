ActiveAdmin.register Issue do
  menu :label => "Krajki"
  menu :url => "/12_gustkiewicz/krajka/admin/issues"
  permit_params :date, :mark, :title, :picture, :volume, :price
end