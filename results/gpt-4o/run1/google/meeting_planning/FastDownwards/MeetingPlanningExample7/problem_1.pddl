(define (problem visiting_friends)
  (:domain san_francisco_visit)
  
  (:objects
    richmond_district north_beach - location
    john - friend
    arrival_at_richmond_0900 start_window_north_beach_1515 end_window_north_beach_1715 - time
  )
  
  (:init
    (at richmond_district)
    (current_time arrival_at_richmond_0900)
    (friend_at john north_beach start_window_north_beach_1515)
    (friend_at john north_beach end_window_north_beach_1715)
  )
  
  (:goal
    (met john)
  )
)