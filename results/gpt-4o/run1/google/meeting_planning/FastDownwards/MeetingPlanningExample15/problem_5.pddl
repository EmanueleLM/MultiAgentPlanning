(define (problem meet_john_sf)
  (:domain meeting_friends_sf)

  (:objects 
    russian_hill golden_gate_park - location
    you john - person
    nine_am one_pm three_pm three_thirty_pm four_pm four_thirty_pm five_pm five_forty_five_pm six_fifteen_pm - time_point)
    
  (:init
    (at_location you russian_hill)
    (at_time nine_am)
    (available john golden_gate_park one_pm)
    (available john golden_gate_park three_pm)
    (available john golden_gate_park three_thirty_pm)
    (available john golden_gate_park four_pm)
    (available john golden_gate_park four_thirty_pm)
    (available john golden_gate_park five_pm)
    (available john golden_gate_park five_forty_five_pm)
    (can_travel russian_hill golden_gate_park nine_am one_pm)
    (can_travel golden_gate_park russian_hill three_pm four_pm)
    (before nine_am one_pm)
    (before one_pm three_pm)
    (before three_pm three_thirty_pm)
    (before three_thirty_pm four_pm)
    (before four_pm four_thirty_pm)
    (before four_thirty_pm five_pm)
    (before five_pm five_forty_five_pm)
    (before five_forty_five_pm six_fifteen_pm))

  (:goal
    (meeting_set john))
)