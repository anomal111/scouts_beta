ActiveAdmin.register Issue do
  permit_params :date, :mark, :title, :picture, :volume, :price
end