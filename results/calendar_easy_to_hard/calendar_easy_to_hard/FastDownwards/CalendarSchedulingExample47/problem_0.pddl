(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)

  ;; Objects: 30-minute slots from 09:00 to 16:30 (inclusive)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot

    ;; Add participant objects here, e.g.:
    ;; alice bob carol - person
  )

  (:init
    ;; Mark each declared person as a person, for example:
    ;; (person alice)
    ;; (person bob)
    ;; (person carol)

    ;; Availability facts: ONLY list slots that are actually available for each participant.
    ;; Example:
    ;; (available alice s0900)
    ;; (available alice s0930)
    ;; (available bob s0930)
    ;; (available carol s0930)
    ;;
    ;; DO NOT invent availability beyond what you provide.
  )

  ;; Goal: a meeting is scheduled (the scheduled-at slot will identify which slot).
  (:goal (meeting-scheduled))
)