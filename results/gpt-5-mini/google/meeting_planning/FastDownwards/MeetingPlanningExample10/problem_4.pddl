(define (problem meeting-planning-instance)
  (:domain meeting-planning)
  (:objects
    you james - agent
    ggp marina - location
    ;; compact set of named time points needed to represent arrival, availability windows, and meeting endpoints
    t0 t16 t75 t90 t255 t270 - time
  )

  (:init
    ;; initial state: you arrive at Golden Gate Park at 09:00 (t0)
    (at you ggp t0)

    ;; travel possibility: leaving GGP at t0 arrives at Marina at t16 (16 minutes)
    ;; (this encodes the 16-minute GGP->Marina duration without enumerating every minute)
    (travel-edge ggp marina t0 t16)

    ;; waiting transitions (sparse): you can wait from arrival to James' start window
    (wait-edge t16 t75)
    ;; chain to allow a late meeting start option
    (wait-edge t75 t255)

    ;; James availability windows encoded as contiguous 15-minute meeting-capable intervals:
    ;; - early option: 10:15 (t75) -> 10:30 (t90)
    ;; - late option: 13:15 (t255) -> 13:30 (t270)
    ;; (These facts encode that a 15-minute meeting may start at t75 or at t255.)
    (available-james t75 t90)
    (available-james t255 t270)
  )

  ;; Goal: meet James for at least one required 15-minute contiguous interval
  (:goal (met))
)