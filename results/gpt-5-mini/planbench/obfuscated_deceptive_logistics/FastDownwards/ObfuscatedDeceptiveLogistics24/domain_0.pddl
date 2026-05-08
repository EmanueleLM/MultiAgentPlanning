(define (domain multiagent-seq)
  :requirements :strips :typing :negative-preconditions
  :types agent task loc slot

  :predicates
    (at ?a - agent ?l - loc)
    (task-at ?t - task ?l - loc)
    (task-done ?t - task)
    (assigned ?t - task ?a - agent)
    (current-slot ?s - slot)
    (successor ?s1 - slot ?s2 - slot)
    (slot-last ?s - slot)
    (ready ?t - task)
    (succ-task ?t1 - task ?t2 - task)
    (terminal-task ?t - task)
  )

  ;; ACTIONS for agentA
  (:action agentA_do_withsucc_succTask
    :parameters (?a - agent ?t - task ?l - loc ?s - slot ?s2 - slot ?t2 - task)
    :precondition (and
                    (assigned ?t ?a)
                    (at ?a ?l)
                    (task-at ?t ?l)
                    (current-slot ?s)
                    (successor ?s ?s2)
                    (ready ?t)
                    (succ-task ?t ?t2)
                    (not (task-done ?t))
                  )
    :effect (and
              (task-done ?t)
              (not (ready ?t))
              (ready ?t2)
              (not (current-slot ?s))
              (current-slot ?s2)
            )
  )

  (:action agentA_do_withsucc_terminalTask
    :parameters (?a - agent ?t - task ?l - loc ?s - slot ?s2 - slot)
    :precondition (and
                    (assigned ?t ?a)
                    (at ?a ?l)
                    (task-at ?t ?l)
                    (current-slot ?s)
                    (successor ?s ?s2)
                    (ready ?t)
                    (terminal-task ?t)
                    (not (task-done ?t))
                  )
    :effect (and
              (task-done ?t)
              (not (ready ?t))
              (not (current-slot ?s))
              (current-slot ?s2)
            )
  )

  (:action agentA_do_last_terminalTask
    :parameters (?a - agent ?t - task ?l - loc ?s - slot)
    :precondition (and
                    (assigned ?t ?a)
                    (at ?a ?l)
                    (task-at ?t ?l)
                    (current-slot ?s)
                    (slot-last ?s)
                    (ready ?t)
                    (terminal-task ?t)
                    (not (task-done ?t))
                  )
    :effect (and
              (task-done ?t)
              (not (ready ?t))
              (not (current-slot ?s))
            )
  )

  ;; ACTIONS for agentB
  (:action agentB_do_withsucc_succTask
    :parameters (?a - agent ?t - task ?l - loc ?s - slot ?s2 - slot ?t2 - task)
    :precondition (and
                    (assigned ?t ?a)
                    (at ?a ?l)
                    (task-at ?t ?l)
                    (current-slot ?s)
                    (successor ?s ?s2)
                    (ready ?t)
                    (succ-task ?t ?t2)
                    (not (task-done ?t))
                  )
    :effect (and
              (task-done ?t)
              (not (ready ?t))
              (ready ?t2)
              (not (current-slot ?s))
              (current-slot ?s2)
            )
  )

  (:action agentB_do_withsucc_terminalTask
    :parameters (?a - agent ?t - task ?l - loc ?s - slot ?s2 - slot)
    :precondition (and
                    (assigned ?t ?a)
                    (at ?a ?l)
                    (task-at ?t ?l)
                    (current-slot ?s)
                    (successor ?s ?s2)
                    (ready ?t)
                    (terminal-task ?t)
                    (not (task-done ?t))
                  )
    :effect (and
              (task-done ?t)
              (not (ready ?t))
              (not (current-slot ?s))
              (current-slot ?s2)
            )
  )

  (:action agentB_do_last_terminalTask
    :parameters (?a - agent ?t - task ?l - loc ?s - slot)
    :precondition (and
                    (assigned ?t ?a)
                    (at ?a ?l)
                    (task-at ?t ?l)
                    (current-slot ?s)
                    (slot-last ?s)
                    (ready ?t)
                    (terminal-task ?t)
                    (not (task-done ?t))
                  )
    :effect (and
              (task-done ?t)
              (not (ready ?t))
              (not (current-slot ?s))
            )
  )