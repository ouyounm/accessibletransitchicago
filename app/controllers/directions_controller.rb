class DirectionsController < ApplicationController

  def landing_page
  end

  def get_directions

    @direction = Direction.new
    @direction.start = params[:start]
    @direction.destination = params[:destination]

    @results = @direction.return_directions
    render 'route'

    accessible_array = %w[Kimball, Kedzie, Francisco, Rockwell, Western, Damen, Montrose, Irving Park, Addison, Paulina, Southport, Belmont, Wellington, Diversey, Fullerton, Armitage, Sedgwick, Chicago, Merchandise Mart, Washington/Wells, Harold Washington Library-State/Van Buren, Clark/Lake, O’Hare, Rosemont, Cumberland, Harlem (O'Hare), Jefferson Park, Logan Square, Western (O’Hare), Clark/Lake, Jackson, UIC-Halsted, Illinois Medical District (Damen Entrance), Kedzie-Homan, Forest Park, Ashland/63rd, Halsted, Cottage Grove, King Drive, Garfield, 51st, 47th, 43rd, Indiana, 35th-Bronzeville-IIT, Roosevelt, Clark/Lake, Clinton, Morgan, Ashland, California, Kedzie, Conservatory-Central Park Drive, Pulaski, Cicero, Laramie, Central, Harlem/Lake (via Marion entrance), Midway, Pulaski, Kedzie, Western, 35/Archer, Ashland, Halsted, Roosevelt; also Harold Washington Library-State/Van Buren, Washington/Wells, and Clark/Lake, 54th/Cermak, Cicero, Kostner, Pulaski, Central Park, Kedzie, California, Western, Damen, 18th, Polk, Ashland, Morgan, Clinton, Clark/Lake, Harold Washington Library-State/Van Buren, and Washington/Wells, 54th/Cermak, Cicero, Kostner, Pulaski, Central Park, Kedzie, California, Western, Damen, 18th, Polk, Ashland, Morgan, Clinton, Clark/Lake, Harold Washington Library-State/Van Buren, and Washington/Wells, Howard, Loyola, Granville, Addison, Belmont, Fullerton, Chicago, Grand, Lake, Jackson, Roosevelt, Cermak-Chinatown, Sox-35th, 47th, Garfield, 63rd, 69th, 79th, 87th, 95th/Dan Ryan, Howard, Oakton-Skokie, Dempster-Skokie]

  end

end
