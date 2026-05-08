(define (problem meet_john_sf)
  (:domain meeting_friends_sf)
  
  (:objects 
    russian_hill golden_gate_park - location
    you john - person
    event_start 1pm 3pm 3_30pm 4pm 4_30pm 5pm 5_45pm - time_point)

  (:init
    (at you russian_hill event_start)
    (friend_available john golden_gate_park 1pm)
    (friend_available john golden_gate_park 3pm)
    (friend_available john golden_gate_park 3_30pm)
    (friend_available john golden_gate_park 4pm)
    (friend_available john golden_gate_park 4_30pm)
    (friend_available john golden_gate_park 5pm)
    (friend_available john golden_gate_park 5_45pm)
    (can_travel russian_hill golden_gate_park event_start 1pm)
    (can_travel golden_gate_park russian_hill 3pm 4pm)
    (meeting_window_exists 3pm 4_30pm)
    (meeting_window_exists 3_30pm 5pm)
    (meeting_window_exists 4pm 5_30pm)
    (meeting_window_exists 4_30pm 6pm)
    (meeting_window_exists 5pm 6_30pm))

  (:goal
    (and
      (meeting_scheduled john)))
)