(define (domain meeting-orchestration)
  (:requirements :strips)
  (:predicates
    (succ ?s ?s2)
    (agent-at ?a ?loc ?s)
    (travel-plan ?a ?from ?to ?dep ?arr)
    (available-for-meeting ?a ?start)
    (meeting-held)
  )

  (:action wait
    :parameters (?a ?loc ?s1 ?s2)
    :precondition (and (agent-at ?a ?loc ?s1) (succ ?s1 ?s2))
    :effect (and (not (agent-at ?a ?loc ?s1)) (agent-at ?a ?loc ?s2))
  )

  (:action travel
    :parameters (?a ?from ?to ?dep ?arr)
    :precondition (and (agent-at ?a ?from ?dep) (travel-plan ?a ?from ?to ?dep ?arr))
    :effect (and (not (agent-at ?a ?from ?dep)) (agent-at ?a ?to ?arr))
  )

  (:action meet
    :parameters (?a1 ?a2 ?a3 ?start
                 ?s1 ?s2 ?s3 ?s4 ?s5 ?s6 ?s7 ?s8 ?s9 ?s10 ?s11 ?s12 ?s13 ?s14)
    :precondition (and
      (available-for-meeting ?a1 ?start)
      (available-for-meeting ?a2 ?start)
      (available-for-meeting ?a3 ?start)

      (succ ?start ?s1) (succ ?s1 ?s2) (succ ?s2 ?s3) (succ ?s3 ?s4)
      (succ ?s4 ?s5) (succ ?s5 ?s6) (succ ?s6 ?s7) (succ ?s7 ?s8)
      (succ ?s8 ?s9) (succ ?s9 ?s10) (succ ?s10 ?s11) (succ ?s11 ?s12)
      (succ ?s12 ?s13) (succ ?s13 ?s14)

      (agent-at ?a1 office ?start) (agent-at ?a1 office ?s1) (agent-at ?a1 office ?s2)
      (agent-at ?a1 office ?s3) (agent-at ?a1 office ?s4) (agent-at ?a1 office ?s5)
      (agent-at ?a1 office ?s6) (agent-at ?a1 office ?s7) (agent-at ?a1 office ?s8)
      (agent-at ?a1 office ?s9) (agent-at ?a1 office ?s10) (agent-at ?a1 office ?s11)
      (agent-at ?a1 office ?s12) (agent-at ?a1 office ?s13) (agent-at ?a1 office ?s14)

      (agent-at ?a2 office ?start) (agent-at ?a2 office ?s1) (agent-at ?a2 office ?s2)
      (agent-at ?a2 office ?s3) (agent-at ?a2 office ?s4) (agent-at ?a2 office ?s5)
      (agent-at ?a2 office ?s6) (agent-at ?a2 office ?s7) (agent-at ?a2 office ?s8)
      (agent-at ?a2 office ?s9) (agent-at ?a2 office ?s10) (agent-at ?a2 office ?s11)
      (agent-at ?a2 office ?s12) (agent-at ?a2 office ?s13) (agent-at ?a2 office ?s14)

      (agent-at ?a3 office ?start) (agent-at ?a3 office ?s1) (agent-at ?a3 office ?s2)
      (agent-at ?a3 office ?s3) (agent-at ?a3 office ?s4) (agent-at ?a3 office ?s5)
      (agent-at ?a3 office ?s6) (agent-at ?a3 office ?s7) (agent-at ?a3 office ?s8)
      (agent-at ?a3 office ?s9) (agent-at ?a3 office ?s10) (agent-at ?a3 office ?s11)
      (agent-at ?a3 office ?s12) (agent-at ?a3 office ?s13) (agent-at ?a3 office ?s14)
    )
    :effect (meeting-held)
  )
)