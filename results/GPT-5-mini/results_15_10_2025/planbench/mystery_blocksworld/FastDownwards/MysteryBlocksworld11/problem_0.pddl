(define (problem scenario-1)
  (:domain multiagent-items)
  (:objects
    alice bob - agent
    coin paperclip cup - item
    kitchen office - location
  )

  (:init
    ;; agent locations
    (at alice kitchen)
    (at bob office)

    ;; items at locations
    (at-item coin kitchen)
    (at-item cup kitchen)
    (at-item paperclip office)

    ;; agents start willing to pick items
    (willing alice)
    (willing bob)
  )

  (:goal (and
    ;; Alice should end up holding the coin
    (has alice coin)
    ;; Bob should end up holding the paperclip
    (has bob paperclip)
    ;; Alice should know about the cup (via memory action)
    (knows alice cup)
  ))
)