ActiveAdmin.register Issue do
  menu :label => "Krajki"
  permit_params :date, :mark, :title, :picture, :volume, :price
end