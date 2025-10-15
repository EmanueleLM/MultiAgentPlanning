(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (is-person ?p - person)
    (is-slot ?s - slot)
    (available ?p - person ?s - slot)
    (attends ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action attend-alice
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (is-person alice) (available alice ?s) (not (meeting-scheduled)) (not (attends alice ?s)))
    :effect (attends alice ?s)
  )

  (:action attend-daniel
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (is-person daniel) (available daniel ?s) (not (meeting-scheduled)) (not (attends daniel ?s)))
    :effect (attends daniel ?s)
  )

  (:action attend-scott
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (is-person scott) (available scott ?s) (not (meeting-scheduled)) (not (attends scott ?s)))
    :effect (attends scott ?s)
  )

  (:action attend-lori
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (is-person lori) (available lori ?s) (not (meeting-scheduled)) (not (attends lori ?s)))
    :effect (attends lori ?s)
  )

  (:action attend-cynthia
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (is-person cynthia) (available cynthia ?s) (not (meeting-scheduled)) (not (attends cynthia ?s)))
    :effect (attends cynthia ?s)
  )

  (:action attend-jeffrey
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (is-person jeffrey) (available jeffrey ?s) (not (meeting-scheduled)) (not (attends jeffrey ?s)))
    :effect (attends jeffrey ?s)
  )

  (:action attend-hannah
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (is-person hannah) (available hannah ?s) (not (meeting-scheduled)) (not (attends hannah ?s)))
    :effect (attends hannah ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (is-slot ?s)
      (not (meeting-scheduled))
      (attends alice ?s)
      (attends daniel ?s)
      (attends scott ?s)
      (attends lori ?s)
      (attends cynthia ?s)
      (attends jeffrey ?s)
      (attends hannah ?s)
    )
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)