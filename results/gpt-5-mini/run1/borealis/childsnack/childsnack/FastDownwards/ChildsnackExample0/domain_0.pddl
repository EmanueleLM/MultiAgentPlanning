(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child tray sandwich location)

  (:predicates
    (child ?c - child)
    (tray ?t - tray)
    (sandwich ?s - sandwich)
    (location ?l - location)

    ;; type of sandwich
    (is-glutenfree ?s - sandwich)
    (is-regular ?s - sandwich)

    ;; place markers for special locations
    (kitchen ?l - location)
    (serving_area ?l - location)

    ;; sandwich state and placement
    (prepared ?s - sandwich)
    (at ?s - sandwich ?l - location)          ;; sandwich located at a location
    (on-tray ?s - sandwich ?t - tray)        ;; sandwich placed on a tray
    (tray-at ?t - tray ?l - location)        ;; tray located at a location
    (consumed ?s - sandwich)                 ;; sandwich has been served / taken

    ;; child state
    (has-gluten-allergy ?c - child)
    (served ?c - child)
  )

  ;; make a gluten-free sandwich; must be performed at a kitchen location
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?loc - location)
    :precondition (and
                    (is-glutenfree ?s)
                    (not (prepared ?s))
                    (kitchen ?loc)
                  )
    :effect (and
              (prepared ?s)
              (at ?s ?loc)
            )
  )

  ;; make a regular (non-gluten-free) sandwich; must be performed at a kitchen location
  (:action make_sandwich
    :parameters (?s - sandwich ?loc - location)
    :precondition (and
                    (is-regular ?s)
                    (not (prepared ?s))
                    (kitchen ?loc)
                  )
    :effect (and
              (prepared ?s)
              (at ?s ?loc)
            )
  )

  ;; put a prepared sandwich onto a tray; must be done where the tray and sandwich are (kitchen)
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?loc - location)
    :precondition (and
                    (prepared ?s)
                    (at ?s ?loc)
                    (tray-at ?t ?loc)
                    (kitchen ?loc)
                    (not (on-tray ?s ?t))
                  )
    :effect (and
              (on-tray ?s ?t)
              (not (at ?s ?loc))
            )
  )

  ;; move a tray between locations (e.g., from kitchen to serving area)
  (:action move_tray
    :parameters (?t - tray ?from - location ?to - location)
    :precondition (and
                    (tray-at ?t ?from)
                    (not (tray-at ?t ?to))
                  )
    :effect (and
              (tray-at ?t ?to)
              (not (tray-at ?t ?from))
            )
  )

  ;; serve a gluten-free sandwich to a child with gluten allergy; tray must be in serving_area
  (:action serve_sandwich_no_gluten
    :parameters (?t - tray ?s - sandwich ?c - child ?loc - location)
    :precondition (and
                    (on-tray ?s ?t)
                    (tray-at ?t ?loc)
                    (serving_area ?loc)
                    (is-glutenfree ?s)
                    (has-gluten-allergy ?c)
                    (not (served ?c))
                    (not (consumed ?s))
                  )
    :effect (and
              (served ?c)
              (consumed ?s)
              (not (on-tray ?s ?t))
            )
  )

  ;; serve a regular sandwich to a child who does NOT have gluten allergy; tray must be in serving_area
  (:action serve_sandwich
    :parameters (?t - tray ?s - sandwich ?c - child ?loc - location)
    :precondition (and
                    (on-tray ?s ?t)
                    (tray-at ?t ?loc)
                    (serving_area ?loc)
                    (is-regular ?s)
                    (not (has-gluten-allergy ?c))
                    (not (served ?c))
                    (not (consumed ?s))
                  )
    :effect (and
              (served ?c)
              (consumed ?s)
              (not (on-tray ?s ?t))
            )
  )
)