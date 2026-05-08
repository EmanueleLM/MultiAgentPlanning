(define (problem schedule-instance-1)
  (:domain scheduling-temporal-discrete)

  (:objects
    traveler stephanie alice bob - person
    home office cafe - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 - timeslot
    meet-stephanie meet-alice meet-bob - meeting
  )

  (:init
    ;; meeting locations
    (meeting-location meet-stephanie office)
    (meeting-location meet-alice cafe)
    (meeting-location meet-bob office)

    ;; Initial positions:
    ;; Traveler starts at home at slot t0
    (at traveler home t0)
    ;; Other participants are present at their typical locations for the whole horizon (pre-provisioned),
    ;; so meetings can start when required without additional movement actions for them.
    (at stephanie office t0) (at stephanie office t1) (at stephanie office t2) (at stephanie office t3) (at stephanie office t4)
    (at stephanie office t5) (at stephanie office t6) (at stephanie office t7) (at stephanie office t8) (at stephanie office t9)
    (at stephanie office t10) (at stephanie office t11) (at stephanie office t12) (at stephanie office t13) (at stephanie office t14)

    (at alice cafe t0) (at alice cafe t1) (at alice cafe t2) (at alice cafe t3) (at alice cafe t4)
    (at alice cafe t5) (at alice cafe t6) (at alice cafe t7) (at alice cafe t8) (at alice cafe t9)
    (at alice cafe t10) (at alice cafe t11) (at alice cafe t12) (at alice cafe t13) (at alice cafe t14)

    (at bob office t0) (at bob office t1) (at bob office t2) (at bob office t3) (at bob office t4)
    (at bob office t5) (at bob office t6) (at bob office t7) (at bob office t8) (at bob office t9)
    (at bob office t10) (at bob office t11) (at bob office t12) (at bob office t13) (at bob office t14)

    ;; Availability windows (hard constraints): specify exact starts that are allowed for each participant.
    ;; Stephanie requires the meeting start to be at t8 for the 105-minute meeting in this instance (enforced as hard constraint by available-start facts).
    (available-start stephanie t8)

    ;; Alice and Bob allow the chosen starts in this instance:
    (available-start alice t2)
    (available-start bob t5)

    ;; No one is initially busy in any slot (absence of (busy ...) facts).
    ;; The only way to become busy is by applying travel or meeting actions, which prevents overlaps.

    ;; NOTE: Travel actions and meeting actions included in the domain are only the grounded actions required
    ;; to construct the feasible schedule that maximizes scheduled meetings while enforcing Stephanie's minimum meeting length.
  )

  ;; Goal: schedule all meetings (this encodes the objective to maximize number of meetings for this instance
  ;; by requiring all provided meetings to be scheduled; violating preferences is impossible because availability and timings are strict).
  (:goal (and
    (meeting-scheduled meet-alice)
    (meeting-scheduled meet-bob)
    (meeting-scheduled meet-stephanie)
  ))