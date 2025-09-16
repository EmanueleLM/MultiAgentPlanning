(define (problem monday-meeting-orchestrated)
  (:domain orchestrated-meeting)
  (:objects t12_00 - start)

  (:init
     (billy-free t12_00)
     (slot-available t12_00)
     (pair-free p1 t12_00)
     (pair-free p2 t12_00)
     (pair-free p3 t12_00)
  )

  (:goal (meeting_scheduled))
)