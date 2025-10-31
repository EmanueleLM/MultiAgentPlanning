(define (problem schedule-with-stephanie)
  (:domain meeting-scheduling)

  (:objects
    organizer steph - agent
    home organizer_home steph_office - location
  )

  ;; Initial logical state
  (:init
    ;; initial locations
    (at organizer organizer_home)
    (at steph steph_office)

    ;; numeric initializations
    (= (time) 0)
    (= (meeting-progress) 0)
    (= (meeting-start-time) 999999) ;; large sentinel

    ;; Travel times (minutes)
    ;; travel-time from organizer_home to steph_office = 15 minutes
    (= (travel-time organizer_home steph_office) 15)
    ;; define reverse travel as same duration
    (= (travel-time steph_office organizer_home) 15)

    ;; Availability windows (minutes since midnight)
    ;; Note: these availability values are encoded from the integrated agent inputs
    ;; Organizer availability: 09:00-17:00 -> 540-1020
    (= (avail-from organizer) 540)
    (= (avail-to organizer) 1020)

    ;; Stephanie availability: 10:00-16:00 -> 600-960
    (= (avail-from steph) 600)
    (= (avail-to steph) 960)
  )

  ;; Objective: prioritize earliest meeting start time that satisfies all constraints.
  ;; We minimize the recorded meeting-start-time (planner-compatible minimization).
  (:metric minimize (meeting-start-time))

  ;; Goal: meeting scheduled (meeting of at least 105 minutes with Stephanie)
  (:goal (and
    (meeting-scheduled)
  ))
)