(define (problem deliver-cargo-audit)
  (:domain transport-audit)
  (:objects
    truck1 truck2 - truck
    plane1 - airplane
    loader1 - equipment
    cargo1 - cargo
    warehouse airportA airportB dest_depot - location
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p_done - phase
  )
  (:init
    ;; initial positions
    (at truck1 warehouse)
    (at truck2 dest_depot)
    (at plane1 airportA)
    (at loader1 airportA)

    ;; initial cargo location (not on any vehicle)
    (cargo-at cargo1 warehouse)

    ;; start phase and phase order (explicit successor links enforce contiguity)
    (current-phase p1)
    (phase-next p1 p2)
    (phase-next p2 p3)
    (phase-next p3 p4)
    (phase-next p4 p5)
    (phase-next p5 p6)
    (phase-next p6 p7)
    (phase-next p7 p8)
    (phase-next p8 p9)
    (phase-next p9 p10)
    (phase-next p10 p_done)

    ;; bind each concrete phase to a semantic role (strict constraints)
    (phase-is-inspect p1)
    (phase-is-load-truck p2)
    (phase-is-drive-to-airport p3)
    (phase-is-load-airplane p4)
    (phase-is-fuel p5)
    (phase-is-fly p6)
    (phase-is-drive-to-airport2 p7)
    (phase-is-unload-airplane p8)
    (phase-is-drive-to-dest p9)
    (phase-is-unload-truck p10)
    (phase-is-done p_done)
  )
  (:goal (and
           ;; final mandated terminal conditions:
           ;; - cargo delivered to the depot
           ;; - receiving truck ends at the depot
           ;; - loader has been inspected (auditor remediation)
           ;; - airplane ended at the destination airport
           ;; - global sequence has advanced to done phase
           (cargo-at cargo1 dest_depot)
           (at truck2 dest_depot)
           (loader-inspected loader1)
           (at plane1 airportB)
           (current-phase p_done)
         )
  )
)