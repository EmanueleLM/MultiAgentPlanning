(define (problem monday-meeting-integrated)
  (:domain meeting-scheduler-integrated)
  ;; No additional objects required: Brittany/Emily/Doris and M1 are domain constants
  (:init
     ;; Availability: all three are available at 09:00, 11:00, and 14:30 (for robustness)
     (available Brittany t0900) (available Emily t0900) (available Doris t0900)
     (available Brittany t1100) (available Emily t1100) (available Doris t1100)
     (available Brittany t1430) (available Emily t1430) (available Doris t1430)

     ;; Free for all three key slots
     (free Brittany t0900) (free Emily t0900) (free Doris t0900)
     (free Brittany t1100) (free Emily t1100) (free Doris t1100)
     (free Brittany t1430) (free Emily t1430) (free Doris t1430)

     ;; Initially, no meeting is scheduled at any time
     ;; (negation of these facts is assumed by closed world)
  )
  (:goal (exists (?t - time) (meeting_scheduled_at ?t)))
)