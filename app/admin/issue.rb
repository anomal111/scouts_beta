ActiveAdmin.register Issue do
  menu :label => "Krajki", :url => "/12_gustkiewicz/krajka/admin/issues"
  
  permit_params :date, :mark, :title, :picture, :volume, :price, :active
  
  show do
    attributes_table do
      row :id
      row :created_at
      row "Tytuł" do
        issue.title
      end
      row "Oznaczenie" do
        issue.mark
      end
      row "Nakład" do
        issue.volume
      end
      row "Cena za szt." do
        issue.price
      end
      row "Data" do
        issue.date
      end
      row "Aktywne" do
        issue.active
      end
      row "Okładka" do |issue|
        image_tag issue.picture(:thumb)
      end
    end
  end
  
  index do
    selectable_column
    id_column
    column "Okładka" do |issue|
      image_tag issue.picture(:thumb)
    end
    column :created_at
    column "Tytuł", :title
    column "Oznaczenie", :mark
    column "Nakład", :volume
    column "Cena za szt.", :price
    column "Data wydania", :date
    column "Aktywne", :active
    actions
  end
  
  form do |f|
      f.inputs "Nowa Krajka" do
          f.input :title, :label => "Tytuł"
          f.input :mark, :label => "Oznaczenie"
          f.input :volume, :label => "Nakład"
          f.input :price, :label => "Cena za szt."
          f.input :date, :label => "Data wydania"
          f.input :picture, :label => "Okładka"
          f.input :active, :label => "Aktywne"
          f.actions
      end
  end
end