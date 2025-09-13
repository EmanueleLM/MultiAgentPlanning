(define (problem integrated-scheduling-problem)
  (:domain integrated-scheduling)
  
  (:objects
    heather nicholas zachary - person
    ts-0900 ts-0930 ts-1000 ts-1030 ts-1100 ts-1130 
    ts-1200 ts-1230 ts-1300 ts-1330 ts-1400 ts-1430 
    ts-1500 ts-1530 ts-1600 - time-slot
  )
  
  (:init
    ; Define available time slots for Heather
    (available heather ts-0930) (available heather ts-1000)
    (available heather ts-1100) (available heather ts-1130)
    (available heather ts-1200) (available heather ts-1230)
    (available heather ts-1300) (available heather ts-1330)
    (available heather ts-1500) (available heather ts-1530)
    (available heather ts-1600)

    ; Define available time slots for Nicholas
    (available nicholas ts-0930) (available nicholas ts-1000)
    (available nicholas ts-1030) (available nicholas ts-1100)
    (available nicholas ts-1130) (available nicholas ts-1200)
    (available nicholas ts-1300)

    ; Define available time slots for Zachary
    (available zachary ts-1000) (available zachary ts-1030)
    (available zachary ts-1100) (available zachary ts-1130)
    (available zachary ts-1200) (available zachary ts-1300)

    ; Define Zachary's preference
    (time-slot-preference zachary ts-1030) (time-slot-preference zachary ts-1200)
    
    ; Define all time slots
    (time-slot ts-0900) (time-slot ts-0930) (time-slot ts-1000)
    (time-slot ts-1030) (time-slot ts-1100) (time-slot ts-1130)
    (time-slot ts-1200) (time-slot ts-1230) (time-slot ts-1300)
    (time-slot ts-1330) (time-slot ts-1400) (time-slot ts-1430)
    (time-slot ts-1500) (time-slot ts-1530) (time-slot ts-1600)
  )
  
  (:goal
    (exists (?s - time-slot)
      (and
        (meeting-scheduled ?s)
        (time-slot-preference zachary ?s)
      )
    )
  )
)