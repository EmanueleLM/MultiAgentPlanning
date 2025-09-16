<define (problem monday-meeting-orchestrated)
  (:domain orchestrated-meeting)
  (:objects t12_00 - start)

  (:init
     ; Billy's calendar: free at 12:00
     (billy-free t12_00)

     ; Maria's calendar: 12:00-13:00 is available (i.e., 12:00 start is OK)
     (slot-available t12_00)

     ; William's calendar: all three participants are free at 12:00
     (pair-free p1 t12_00)
     (pair-free p2 t12_00)
     (pair-free p3 t12_00)
  )

  (:goal (meeting-scheduled))
)