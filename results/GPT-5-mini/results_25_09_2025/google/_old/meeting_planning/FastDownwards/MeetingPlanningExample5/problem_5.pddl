(define (problem meeting-instance)
  (:domain meeting-orchestrator)

  (:objects
    visitor william - agent
    Nob_Hill The_Castro - location
    t0900 t0917 t1158 t1215 t1330 t2200 - timepoint
  )

  (:init
    (at visitor Nob_Hill)
    (at william The_Castro)

    (current-time t0900)

    ;; waiting options (discrete time progression allowed)
    (can-wait t0900 t0917)
    (can-wait t0900 t1158)
    (can-wait t0900 t1215)
    (can-wait t0917 t1215)
    (can-wait t1158 t1215)
    (can-wait t1215 t1330)
    (can-wait t1330 t2200)

    ;; travel possibilities for visitor (Nob Hill -> The Castro takes 17 minutes)
    (can-travel-visitor Nob_Hill The_Castro t0900 t0917)
    (can-travel-visitor Nob_Hill The_Castro t1158 t1215)

    ;; travel possibilities for william (not needed but domain supports it)
    ;; (no can-travel-william facts provided so william will remain at The_Castro)

    ;; meeting span representing the required meeting of 75 minutes starting at 12:15 and ending at 13:30
    (meeting-span t1215 t1330)

    ;; availability to start meeting at 12:15
    (can-start visitor t1215)
    (can-start william t1215)
  )

  (:goal (meeting-done))
)