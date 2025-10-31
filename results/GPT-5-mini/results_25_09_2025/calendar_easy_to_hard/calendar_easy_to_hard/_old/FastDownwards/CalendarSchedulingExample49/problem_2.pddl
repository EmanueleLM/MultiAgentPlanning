(define (problem schedule-monday)
  (:domain meeting-scheduler)
  (:objects
    ts09_00 ts09_30 ts10_00 ts10_30 ts11_00 ts11_30 ts12_00 ts12_30
    ts13_00 ts13_30 ts14_00 ts14_30 ts15_00 ts15_30 ts16_00 ts16_30 - timeslot
    m1 - meeting
    alan mason dennis theresa brenda juan angela - person
  )
  (:init
    (participant alan m1)
    (participant mason m1)
    (participant dennis m1)
    (participant theresa m1)
    (participant brenda m1)
    (participant juan m1)
    (participant angela m1)

    (busy alan ts09_00)
    (busy alan ts10_00)
    (busy alan ts10_30)
    (busy alan ts11_30)

    (busy mason ts13_30)
    (busy mason ts16_30)

    (busy dennis ts09_00)
    (busy dennis ts14_30)

    (busy brenda ts10_30)
    (busy brenda ts12_00)
    (busy brenda ts12_30)
    (busy brenda ts13_00)
    (busy brenda ts14_30)
    (busy brenda ts15_00)
    (busy brenda ts16_00)
    (busy brenda ts16_30)

    (busy juan ts09_30)
    (busy juan ts10_30)
    (busy juan ts11_30)
    (busy juan ts12_00)
    (busy juan ts12_30)
    (busy juan ts14_30)
    (busy juan ts16_00)
    (busy juan ts16_30)

    (busy angela ts09_00)
    (busy angela ts09_30)
    (busy angela ts10_30)
    (busy angela ts11_30)
    (busy angela ts13_00)
    (busy angela ts15_00)
    (busy angela ts16_30)

    (prefers mason ts09_00)
    (prefers mason ts09_30)
    (prefers mason ts10_00)
    (prefers mason ts10_30)
    (prefers mason ts11_00)
    (prefers mason ts11_30)
    (prefers mason ts12_00)
    (prefers mason ts12_30)
    (prefers mason ts13_00)
    (prefers mason ts14_00)
  )
  (:goal (exists (?t - timeslot) (scheduled m1 ?t)))
)