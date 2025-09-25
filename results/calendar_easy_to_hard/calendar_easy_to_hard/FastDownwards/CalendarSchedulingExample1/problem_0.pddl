(define (problem schedule-meeting)
  (:domain meeting-scheduling)

  (:objects
    raymond billy donald - agent
    ;; Example time slots (replace or extend to match your actual granularity)
    t9 t10 t11 t12 t13 t14 t15 t16 - timeslot
  )

  (:init
    ;; Work hours: adjust if different (these define which slots may be used).
    (workhour t9) (workhour t10) (workhour t11) (workhour t12)
    (workhour t13) (workhour t14) (workhour t15) (workhour t16)

    ;; --- IMPORTANT: Fill in availability facts below from each agent's input.
    ;; Treat all natural-language "would rather / avoid / earliest" as hard constraints by NOT adding (available ...) for forbidden slots.
    ;; Examples (commented out):
    ;; (available raymond t9)
    ;; (available raymond t10)
    ;; (available billy t10)
    ;; (available billy t11)
    ;; (available donald t9)
    ;; (available donald t11)
    ;;
    ;; If an agent is explicitly unavailable at a slot, DO NOT add (available agent slot).
    ;; Replace the example placeholders above with the real availability derived from Raymond/Billy/Donald.
  )

  ;; Goal: there exists a time t such that that time was chosen and all three agents are scheduled at the same t.
  (:goal
    (exists (?t - timeslot)
      (and
        (meeting-time ?t)
        (agent-scheduled raymond ?t)
        (agent-scheduled billy ?t)
        (agent-scheduled donald ?t)
      )
    )
  )
)