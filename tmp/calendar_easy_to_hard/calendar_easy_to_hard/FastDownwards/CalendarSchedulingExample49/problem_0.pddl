(define (problem schedule-monday)
  (:domain meeting-scheduler)
  (:objects
    ;; 30-minute timeslots from 09:00 to 17:00 (Monday)
    ts-09-00 ts-09-30 ts-10-00 ts-10-30 ts-11-00 ts-11-30 ts-12-00 ts-12-30
    ts-13-00 ts-13-30 ts-14-00 ts-14-30 ts-15-00 ts-15-30 ts-16-00 ts-16-30 - timeslot

    m1 - meeting

    ;; No persons provided here. Add persons like:
    ;; alice bob carol - person
  )

  ;; Initial state: add participant membership, busy times, and preferences here.
  ;; Examples (uncomment and edit as needed):
  ;; (participant alice m1)
  ;; (busy alice ts-09-00)
  ;; (busy alice ts-09-30)
  ;; (prefers alice ts-10-00)
  ;; (participant bob m1)
  ;; (busy bob ts-12-30)
  ;; (prefers bob ts-11-30)

  (:init
    ;; Currently empty: no participants/busy/pref atoms provided.
  )

  ;; Goal: schedule meeting m1 at some timeslot between 09:00 and 17:00.
  (:goal (exists (?t - timeslot) (scheduled m1 ?t)))
)