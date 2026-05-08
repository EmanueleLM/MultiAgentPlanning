(define (problem serve-children)
  (:domain child-snack)
  (:objects
    alice bob - child

    tray1 - tray

    s_g1 s_r1 - sandwich

    kitchen serving_area - location
  )

  (:init
    ;; types / existence
    (child alice)
    (child bob)

    (tray tray1)

    (sandwich s_g1)
    (sandwich s_r1)

    (location kitchen)
    (location serving_area)

    ;; location roles
    (kitchen kitchen)
    (serving_area serving_area)

    ;; initial tray location (tray_report)
    (tray-at tray1 kitchen)

    ;; sandwich types (inventory_report)
    (is-glutenfree s_g1)
    (is-regular s_r1)

    ;; sandwiches initially unprepared (will be prepared by make actions)
    ;; no (prepared ...) facts here

    ;; allergy info (serving_report / audit_report)
    (has-gluten-allergy alice)
    ;; bob has no gluten allergy (absence of has-gluten-allergy indicates no allergy)

    ;; no sandwiches consumed or on-tray at start
    ;; no children served at start
  )

  (:goal (and
           (served alice)
           (served bob)
         ))
)