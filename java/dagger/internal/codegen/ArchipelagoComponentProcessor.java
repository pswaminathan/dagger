/*
 * Copyright (C) 2023 The Dagger Authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package dagger.internal.codegen;

import com.google.auto.service.AutoService;
import com.google.common.collect.ImmutableSet;
import com.google.devtools.kotlin.compiler.plugin.codegen.archipelago.KtCodegenArchipelago;
import com.google.devtools.kotlin.compiler.plugin.codegen.archipelago.KtCodegenElectoralDistrict;
import com.google.devtools.kotlin.compiler.plugin.codegen.archipelago.KtCodegenEnvironment;

/** TODO: Add javadoc */
@AutoService(KtCodegenArchipelago.class)
public final class ArchipelagoComponentProcessor implements KtCodegenArchipelago {
  private static final String DAGGER_JAVAC_PROCESSOR = "dagger.internal.codegen.ComponentProcessor";
  private static final String DAGGER_KSP_PROCESSOR =
      "dagger.internal.codegen.KspComponentProcessor$Provider";

  @Override
  public void onCreate(KtCodegenEnvironment env) {}

  @Override
  public ImmutableSet<KtCodegenElectoralDistrict> providesProcessorElectoralDistricts() {
    return ImmutableSet.of(
        new KtCodegenElectoralDistrict(
            ImmutableSet.of(DAGGER_JAVAC_PROCESSOR),
            ImmutableSet.of(DAGGER_JAVAC_PROCESSOR, DAGGER_KSP_PROCESSOR)));
  }
}
