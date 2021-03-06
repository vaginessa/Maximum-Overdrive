.class Lcom/android/server/BackupManagerService$PerformBackupTask;
.super Ljava/lang/Object;
.source "BackupManagerService.java"

# interfaces
.implements Lcom/android/server/BackupManagerService$BackupRestoreTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PerformBackupTask"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PerformBackupTask"


# instance fields
.field mBackupData:Landroid/os/ParcelFileDescriptor;

.field mBackupDataName:Ljava/io/File;

.field mCurrentPackage:Landroid/content/pm/PackageInfo;

.field mCurrentState:Lcom/android/server/BackupManagerService$BackupState;

.field mFinished:Z

.field mJournal:Ljava/io/File;

.field mNewState:Landroid/os/ParcelFileDescriptor;

.field mNewStateName:Ljava/io/File;

.field mOriginalQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/BackupManagerService$BackupRequest;",
            ">;"
        }
    .end annotation
.end field

.field mQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/BackupManagerService$BackupRequest;",
            ">;"
        }
    .end annotation
.end field

.field mSavedState:Landroid/os/ParcelFileDescriptor;

.field mSavedStateName:Ljava/io/File;

.field mStateDir:Ljava/io/File;

.field mStatus:I

.field mTransport:Lcom/android/internal/backup/IBackupTransport;

.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Ljava/util/ArrayList;Ljava/io/File;)V
    .registers 8
    .parameter
    .parameter "transport"
    .parameter
    .parameter "journal"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/backup/IBackupTransport;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/BackupManagerService$BackupRequest;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1810
    .local p3, queue:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/BackupManagerService$BackupRequest;>;"
    iput-object p1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1811
    iput-object p2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    .line 1812
    iput-object p3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    .line 1813
    iput-object p4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    .line 1816
    :try_start_b
    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/android/server/BackupManagerService;->mBaseStateDir:Ljava/io/File;

    invoke-interface {p2}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;
    :try_end_18
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_18} :catch_20

    .line 1821
    :goto_18
    sget-object v0, Lcom/android/server/BackupManagerService$BackupState;->INITIAL:Lcom/android/server/BackupManagerService$BackupState;

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/BackupManagerService$BackupState;

    .line 1822
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mFinished:Z

    .line 1823
    return-void

    .line 1817
    :catch_20
    move-exception v0

    goto :goto_18
.end method


# virtual methods
.method agentErrorCleanup()V
    .registers 2

    .prologue
    .line 2196
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2197
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2198
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->clearAgentState()V

    .line 2200
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1b

    sget-object v0, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    :goto_17
    invoke-virtual {p0, v0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 2201
    return-void

    .line 2200
    :cond_1b
    sget-object v0, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_17
.end method

.method beginBackup()V
    .registers 8

    .prologue
    const/4 v3, 0x0

    .line 1851
    iput v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1854
    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_13

    .line 1855
    const-string v3, "PerformBackupTask"

    const-string v4, "Backup begun with an empty queue - nothing to do."

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1915
    :cond_12
    :goto_12
    return-void

    .line 1862
    :cond_13
    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    iput-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    .line 1864
    const-string v3, "PerformBackupTask"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Beginning backup of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " targets"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1866
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    const-string v4, "@pm@"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1868
    .local v2, pmState:Ljava/io/File;
    const/16 v3, 0xb05

    :try_start_4c
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v4}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 1871
    iget v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v3, :cond_85

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-gtz v3, :cond_85

    .line 1872
    const-string v3, "PerformBackupTask"

    const-string v4, "Initializing (wiping) backup state and transport storage"

    invoke-static {v3, v4}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1873
    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v3, v4}, Lcom/android/server/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 1874
    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v3}, Lcom/android/internal/backup/IBackupTransport;->initializeDevice()I

    move-result v3

    iput v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1875
    iget v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v3, :cond_ce

    .line 1876
    const/16 v3, 0xb0b

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3, v4}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 1888
    :cond_85
    :goto_85
    iget v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v3, :cond_ac

    .line 1889
    new-instance v1, Lcom/android/server/PackageManagerBackupAgent;

    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v3}, Lcom/android/server/BackupManagerService;->access$500(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v4}, Lcom/android/server/BackupManagerService;->allAgentPackages()Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/android/server/PackageManagerBackupAgent;-><init>(Landroid/content/pm/PackageManager;Ljava/util/List;)V

    .line 1891
    .local v1, pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    const-string v3, "@pm@"

    invoke-virtual {v1}, Lcom/android/server/PackageManagerBackupAgent;->onBind()Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Landroid/app/IBackupAgent$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/IBackupAgent;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-virtual {p0, v3, v4, v5}, Lcom/android/server/BackupManagerService$PerformBackupTask;->invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I

    move-result v3

    iput v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1895
    .end local v1           #pmAgent:Lcom/android/server/PackageManagerBackupAgent;
    :cond_ac
    iget v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_bc

    .line 1899
    const/16 v3, 0xb0a

    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v4}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I
    :try_end_bc
    .catchall {:try_start_4c .. :try_end_bc} :catchall_fa
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_bc} :catch_dd

    .line 1908
    :cond_bc
    iget v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v3, :cond_12

    .line 1911
    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v3, v4}, Lcom/android/server/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 1912
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v3}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    goto/16 :goto_12

    .line 1878
    :cond_ce
    const/16 v3, 0xb06

    :try_start_d0
    const-string v4, "(initialize)"

    invoke-static {v3, v4}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 1879
    const-string v3, "PerformBackupTask"

    const-string v4, "Transport error in initializeDevice()"

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_dc
    .catchall {:try_start_d0 .. :try_end_dc} :catchall_fa
    .catch Ljava/lang/Exception; {:try_start_d0 .. :try_end_dc} :catch_dd

    goto :goto_85

    .line 1901
    :catch_dd
    move-exception v0

    .line 1902
    .local v0, e:Ljava/lang/Exception;
    :try_start_de
    const-string v3, "PerformBackupTask"

    const-string v4, "Error in backup thread"

    invoke-static {v3, v4, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1903
    const/4 v3, 0x1

    iput v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_e8
    .catchall {:try_start_de .. :try_end_e8} :catchall_fa

    .line 1908
    iget v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v3, :cond_12

    .line 1911
    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v3, v4}, Lcom/android/server/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 1912
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v3}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    goto/16 :goto_12

    .line 1908
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_fa
    move-exception v3

    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v4, :cond_10b

    .line 1911
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 1912
    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v4}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    :cond_10b
    throw v3
.end method

.method clearAgentState()V
    .registers 3

    .prologue
    .line 2205
    :try_start_0
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_4c

    .line 2206
    :cond_9
    :goto_9
    :try_start_9
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_12} :catch_4a

    .line 2207
    :cond_12
    :goto_12
    :try_start_12
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_1b} :catch_48

    .line 2208
    :cond_1b
    :goto_1b
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 2209
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v0, Lcom/android/server/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2210
    :try_start_27
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 2211
    monitor-exit v1
    :try_end_2f
    .catchall {:try_start_27 .. :try_end_2f} :catchall_43

    .line 2214
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v0, :cond_42

    .line 2216
    :try_start_35
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    #getter for: Lcom/android/server/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static {v0}, Lcom/android/server/BackupManagerService;->access$700(Lcom/android/server/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->unbindBackupAgent(Landroid/content/pm/ApplicationInfo;)V
    :try_end_42
    .catch Landroid/os/RemoteException; {:try_start_35 .. :try_end_42} :catch_46

    .line 2219
    :cond_42
    :goto_42
    return-void

    .line 2211
    :catchall_43
    move-exception v0

    :try_start_44
    monitor-exit v1
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_43

    throw v0

    .line 2217
    :catch_46
    move-exception v0

    goto :goto_42

    .line 2207
    :catch_48
    move-exception v0

    goto :goto_1b

    .line 2206
    :catch_4a
    move-exception v0

    goto :goto_12

    .line 2205
    :catch_4c
    move-exception v0

    goto :goto_9
.end method

.method clearMetadata()V
    .registers 4

    .prologue
    .line 2039
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    const-string v2, "@pm@"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2040
    .local v0, pmState:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_12

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2041
    :cond_12
    return-void
.end method

.method public execute()V
    .registers 3

    .prologue
    .line 1829
    sget-object v0, Lcom/android/server/BackupManagerService$4;->$SwitchMap$com$android$server$BackupManagerService$BackupState:[I

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {v1}, Lcom/android/server/BackupManagerService$BackupState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2a

    .line 1846
    :goto_d
    return-void

    .line 1831
    :pswitch_e
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->beginBackup()V

    goto :goto_d

    .line 1835
    :pswitch_12
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->invokeNextAgent()V

    goto :goto_d

    .line 1839
    :pswitch_16
    iget-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mFinished:Z

    if-nez v0, :cond_21

    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->finalizeBackup()V

    .line 1843
    :goto_1d
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mFinished:Z

    goto :goto_d

    .line 1841
    :cond_21
    const-string v0, "PerformBackupTask"

    const-string v1, "Duplicate finish"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1d

    .line 1829
    nop

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_e
        :pswitch_12
        :pswitch_16
    .end packed-switch
.end method

.method executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V
    .registers 5
    .parameter "nextState"

    .prologue
    .line 2232
    iput-object p1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/BackupManagerService$BackupState;

    .line 2233
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mBackupHandler:Lcom/android/server/BackupManagerService$BackupHandler;

    const/16 v2, 0x14

    invoke-virtual {v1, v2, p0}, Lcom/android/server/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 2234
    .local v0, msg:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mBackupHandler:Lcom/android/server/BackupManagerService$BackupHandler;

    invoke-virtual {v1, v0}, Lcom/android/server/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z

    .line 2235
    return-void
.end method

.method finalizeBackup()V
    .registers 5

    .prologue
    .line 2005
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    if-eqz v0, :cond_26

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_26

    .line 2006
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to remove backup journal file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2012
    :cond_26
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-wide v0, v0, Lcom/android/server/BackupManagerService;->mCurrentToken:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_43

    iget v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v0, :cond_43

    .line 2014
    :try_start_34
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v1}, Lcom/android/internal/backup/IBackupTransport;->getCurrentRestoreSet()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/android/server/BackupManagerService;->mCurrentToken:J
    :try_end_3e
    .catch Landroid/os/RemoteException; {:try_start_34 .. :try_end_3e} :catch_74

    .line 2016
    :goto_3e
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v0}, Lcom/android/server/BackupManagerService;->writeRestoreTokens()V

    .line 2022
    :cond_43
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v0, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2023
    :try_start_48
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/android/server/BackupManagerService;->mBackupRunning:Z

    .line 2024
    iget v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_61

    .line 2026
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->clearMetadata()V

    .line 2027
    const-string v0, "PerformBackupTask"

    const-string v2, "Server requires init; rerunning"

    invoke-static {v0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2028
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v0}, Lcom/android/server/BackupManagerService;->backupNow()V

    .line 2030
    :cond_61
    monitor-exit v1
    :try_end_62
    .catchall {:try_start_48 .. :try_end_62} :catchall_71

    .line 2033
    const-string v0, "PerformBackupTask"

    const-string v1, "Backup pass finished."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2034
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 2035
    return-void

    .line 2030
    :catchall_71
    move-exception v0

    :try_start_72
    monitor-exit v1
    :try_end_73
    .catchall {:try_start_72 .. :try_end_73} :catchall_71

    throw v0

    .line 2015
    :catch_74
    move-exception v0

    goto :goto_3e
.end method

.method public handleTimeout()V
    .registers 5

    .prologue
    .line 2178
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Timeout backing up "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2179
    const/16 v0, 0xb07

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "timeout"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2181
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->agentErrorCleanup()V

    .line 2182
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    #calls: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 2183
    return-void
.end method

.method invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I
    .registers 12
    .parameter "packageName"
    .parameter "agent"
    .parameter "transport"

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 2047
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processOneBackup doBackup() on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2049
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    .line 2050
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mDataDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".data"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    .line 2051
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".new"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    .line 2053
    iput-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 2054
    iput-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    .line 2055
    iput-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    .line 2057
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v0}, Lcom/android/server/BackupManagerService;->generateToken()I

    move-result v4

    .line 2062
    .local v4, token:I
    :try_start_69
    const-string v0, "@pm@"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    .line 2065
    new-instance v0, Landroid/content/pm/PackageInfo;

    invoke-direct {v0}, Landroid/content/pm/PackageInfo;-><init>()V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    .line 2066
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iput-object p1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 2072
    :cond_7c
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    const/high16 v1, 0x1800

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 2076
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    const/high16 v1, 0x3c00

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    .line 2081
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    const/high16 v1, 0x3c00

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    .line 2087
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-wide/16 v1, 0x7530

    invoke-virtual {v0, v4, v1, v2, p0}, Lcom/android/server/BackupManagerService;->prepareOperationTimeout(IJLcom/android/server/BackupManagerService$BackupRestoreTask;)V

    .line 2088
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v0, Lcom/android/server/BackupManagerService;->mBackupManagerBinder:Landroid/app/backup/IBackupManager;

    move-object v0, p2

    invoke-interface/range {v0 .. v5}, Landroid/app/IBackupAgent;->doBackup(Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;)V
    :try_end_af
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_af} :catch_b1

    move v0, v7

    .line 2101
    :goto_b0
    return v0

    .line 2089
    :catch_b1
    move-exception v6

    .line 2090
    .local v6, e:Ljava/lang/Exception;
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error invoking for backup on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2091
    const/16 v0, 0xb07

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v7

    const/4 v2, 0x1

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2093
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->agentErrorCleanup()V

    .line 2094
    const/4 v0, 0x3

    goto :goto_b0
.end method

.method invokeNextAgent()V
    .registers 13

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x3

    const/4 v9, 0x0

    .line 1920
    iput v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1924
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 1925
    const-string v6, "PerformBackupTask"

    const-string v7, "Running queue but it\'s empty!"

    invoke-static {v6, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1926
    sget-object v6, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v6}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 1998
    :cond_19
    :goto_19
    return-void

    .line 1931
    :cond_1a
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/BackupManagerService$BackupRequest;

    .line 1932
    .local v5, request:Lcom/android/server/BackupManagerService$BackupRequest;
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1934
    const-string v6, "PerformBackupTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "starting agent for backup of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1942
    :try_start_3f
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v6}, Lcom/android/server/BackupManagerService;->access$500(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v6

    iget-object v7, v5, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    const/16 v8, 0x40

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    iput-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    .line 1947
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    #getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v6}, Lcom/android/server/BackupManagerService;->access$500(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v6

    iget-object v7, v5, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    const/16 v8, 0x400

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 1949
    .local v1, app:Landroid/content/pm/ApplicationInfo;
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v1, Landroid/content/pm/ApplicationInfo;->sharedLibraryFiles:[Ljava/lang/String;

    iput-object v7, v6, Landroid/content/pm/ApplicationInfo;->sharedLibraryFiles:[Ljava/lang/String;
    :try_end_65
    .catchall {:try_start_3f .. :try_end_65} :catchall_f5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3f .. :try_end_65} :catch_c8

    .line 1952
    const/4 v0, 0x0

    .line 1954
    .local v0, agent:Landroid/app/IBackupAgent;
    :try_start_66
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v6, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    new-instance v7, Landroid/os/WorkSource;

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v8, v8, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-direct {v7, v8}, Landroid/os/WorkSource;-><init>(I)V

    invoke-virtual {v6, v7}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 1955
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v7, v7, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Lcom/android/server/BackupManagerService;->bindToAgentSynchronous(Landroid/content/pm/ApplicationInfo;I)Landroid/app/IBackupAgent;

    move-result-object v0

    .line 1957
    if-eqz v0, :cond_b8

    .line 1958
    iget-object v6, v5, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-virtual {p0, v6, v0, v7}, Lcom/android/server/BackupManagerService$PerformBackupTask;->invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I

    move-result v6

    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_8f
    .catchall {:try_start_66 .. :try_end_8f} :catchall_f5
    .catch Ljava/lang/SecurityException; {:try_start_66 .. :try_end_8f} :catch_bc
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_66 .. :try_end_8f} :catch_c8

    .line 1974
    :goto_8f
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v6, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6, v11}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 1978
    iget v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v6, :cond_19

    .line 1979
    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    .line 1983
    .local v4, nextState:Lcom/android/server/BackupManagerService$BackupState;
    iget v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v6, v10, :cond_132

    .line 1986
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v5, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    #calls: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 1987
    iput v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1988
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_b3

    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    .line 1995
    .end local v0           #agent:Landroid/app/IBackupAgent;
    .end local v1           #app:Landroid/content/pm/ApplicationInfo;
    :cond_b3
    :goto_b3
    invoke-virtual {p0, v4}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    goto/16 :goto_19

    .line 1964
    .end local v4           #nextState:Lcom/android/server/BackupManagerService$BackupState;
    .restart local v0       #agent:Landroid/app/IBackupAgent;
    .restart local v1       #app:Landroid/content/pm/ApplicationInfo;
    :cond_b8
    const/4 v6, 0x3

    :try_start_b9
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_bb
    .catchall {:try_start_b9 .. :try_end_bb} :catchall_f5
    .catch Ljava/lang/SecurityException; {:try_start_b9 .. :try_end_bb} :catch_bc
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_b9 .. :try_end_bb} :catch_c8

    goto :goto_8f

    .line 1966
    :catch_bc
    move-exception v3

    .line 1968
    .local v3, ex:Ljava/lang/SecurityException;
    :try_start_bd
    const-string v6, "PerformBackupTask"

    const-string v7, "error in bind/backup"

    invoke-static {v6, v7, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1969
    const/4 v6, 0x3

    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_c7
    .catchall {:try_start_bd .. :try_end_c7} :catchall_f5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_bd .. :try_end_c7} :catch_c8

    goto :goto_8f

    .line 1971
    .end local v0           #agent:Landroid/app/IBackupAgent;
    .end local v1           #app:Landroid/content/pm/ApplicationInfo;
    .end local v3           #ex:Ljava/lang/SecurityException;
    :catch_c8
    move-exception v2

    .line 1972
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_c9
    const-string v6, "PerformBackupTask"

    const-string v7, "Package does not exist; skipping"

    invoke-static {v6, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d0
    .catchall {:try_start_c9 .. :try_end_d0} :catchall_f5

    .line 1974
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v6, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6, v11}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 1978
    iget v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v6, :cond_19

    .line 1979
    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    .line 1983
    .restart local v4       #nextState:Lcom/android/server/BackupManagerService$BackupState;
    iget v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v6, v10, :cond_128

    .line 1986
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v5, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    #calls: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 1987
    iput v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1988
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_b3

    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_b3

    .line 1974
    .end local v2           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v4           #nextState:Lcom/android/server/BackupManagerService$BackupState;
    :catchall_f5
    move-exception v6

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v7, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v7, v11}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 1978
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v7, :cond_11d

    .line 1979
    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    .line 1983
    .restart local v4       #nextState:Lcom/android/server/BackupManagerService$BackupState;
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v7, v10, :cond_11e

    .line 1986
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v8, v5, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    #calls: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 1987
    iput v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1988
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_11a

    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    .line 1995
    :cond_11a
    :goto_11a
    invoke-virtual {p0, v4}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 1974
    .end local v4           #nextState:Lcom/android/server/BackupManagerService$BackupState;
    :cond_11d
    throw v6

    .line 1989
    .restart local v4       #nextState:Lcom/android/server/BackupManagerService$BackupState;
    :cond_11e
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v7, :cond_11a

    .line 1991
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 1992
    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_11a

    .line 1989
    .restart local v2       #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_128
    iget v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v6, :cond_b3

    .line 1991
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 1992
    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_b3

    .line 1989
    .end local v2           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v0       #agent:Landroid/app/IBackupAgent;
    .restart local v1       #app:Landroid/content/pm/ApplicationInfo;
    :cond_132
    iget v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v6, :cond_b3

    .line 1991
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 1992
    sget-object v4, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto/16 :goto_b3
.end method

.method public operationComplete()V
    .registers 9

    .prologue
    const/4 v6, 0x0

    .line 2110
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v4, v4, Lcom/android/server/BackupManagerService;->mBackupHandler:Lcom/android/server/BackupManagerService$BackupHandler;

    const/4 v5, 0x7

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 2111
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->clearAgentState()V

    .line 2113
    const/4 v0, 0x0

    .line 2114
    .local v0, backupData:Landroid/os/ParcelFileDescriptor;
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2116
    :try_start_f
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    long-to-int v3, v4

    .line 2117
    .local v3, size:I
    if-lez v3, :cond_7b

    .line 2118
    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v4, :cond_2e

    .line 2119
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    const/high16 v5, 0x1000

    invoke-static {v4, v5}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 2121
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    invoke-interface {v4, v5, v0}, Lcom/android/internal/backup/IBackupTransport;->performBackup(Landroid/content/pm/PackageInfo;Landroid/os/ParcelFileDescriptor;)I

    move-result v4

    iput v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2129
    :cond_2e
    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v4, :cond_3a

    .line 2130
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v4}, Lcom/android/internal/backup/IBackupTransport;->finishBackup()I

    move-result v4

    iput v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2139
    :cond_3a
    :goto_3a
    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v4, :cond_b4

    .line 2140
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 2141
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 2142
    const/16 v4, 0xb08

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v7, v7, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2144
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->logBackupComplete(Ljava/lang/String;)V
    :try_end_69
    .catchall {:try_start_f .. :try_end_69} :catchall_be
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_69} :catch_83

    .line 2155
    :goto_69
    if-eqz v0, :cond_6e

    :try_start_6b
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_6b .. :try_end_6e} :catch_b2

    .line 2161
    .end local v3           #size:I
    :cond_6e
    :goto_6e
    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v4, :cond_c5

    .line 2162
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2163
    sget-object v2, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    .line 2169
    .local v2, nextState:Lcom/android/server/BackupManagerService$BackupState;
    :goto_77
    invoke-virtual {p0, v2}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 2170
    return-void

    .line 2133
    .end local v2           #nextState:Lcom/android/server/BackupManagerService$BackupState;
    .restart local v3       #size:I
    :cond_7b
    :try_start_7b
    const-string v4, "PerformBackupTask"

    const-string v5, "no backup data written; not calling transport"

    invoke-static {v4, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_82
    .catchall {:try_start_7b .. :try_end_82} :catchall_be
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_82} :catch_83

    goto :goto_3a

    .line 2149
    .end local v3           #size:I
    :catch_83
    move-exception v1

    .line 2150
    .local v1, e:Ljava/lang/Exception;
    :try_start_84
    const-string v4, "PerformBackupTask"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Transport error backing up "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2151
    const/16 v4, 0xb06

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 2153
    const/4 v4, 0x1

    iput v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_ac
    .catchall {:try_start_84 .. :try_end_ac} :catchall_be

    .line 2155
    if-eqz v0, :cond_6e

    :try_start_ae
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_b1
    .catch Ljava/io/IOException; {:try_start_ae .. :try_end_b1} :catch_b2

    goto :goto_6e

    .end local v1           #e:Ljava/lang/Exception;
    :catch_b2
    move-exception v4

    goto :goto_6e

    .line 2146
    .restart local v3       #size:I
    :cond_b4
    const/16 v4, 0xb06

    :try_start_b6
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I
    :try_end_bd
    .catchall {:try_start_b6 .. :try_end_bd} :catchall_be
    .catch Ljava/lang/Exception; {:try_start_b6 .. :try_end_bd} :catch_83

    goto :goto_69

    .line 2155
    .end local v3           #size:I
    :catchall_be
    move-exception v4

    if-eqz v0, :cond_c4

    :try_start_c1
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_c4
    .catch Ljava/io/IOException; {:try_start_c1 .. :try_end_c4} :catch_d3

    :cond_c4
    :goto_c4
    throw v4

    .line 2166
    :cond_c5
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_d0

    sget-object v2, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    .restart local v2       #nextState:Lcom/android/server/BackupManagerService$BackupState;
    :goto_cf
    goto :goto_77

    .end local v2           #nextState:Lcom/android/server/BackupManagerService$BackupState;
    :cond_d0
    sget-object v2, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_cf

    .line 2155
    :catch_d3
    move-exception v5

    goto :goto_c4
.end method

.method restartBackupAlarm()V
    .registers 5

    .prologue
    .line 2222
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v0, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2224
    :try_start_5
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v2}, Lcom/android/internal/backup/IBackupTransport;->requestBackupTime()J

    move-result-wide v2

    #calls: Lcom/android/server/BackupManagerService;->startBackupAlarmsLocked(J)V
    invoke-static {v0, v2, v3}, Lcom/android/server/BackupManagerService;->access$800(Lcom/android/server/BackupManagerService;J)V
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_12
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_10} :catch_15

    .line 2226
    :goto_10
    :try_start_10
    monitor-exit v1

    .line 2227
    return-void

    .line 2226
    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_10 .. :try_end_14} :catchall_12

    throw v0

    .line 2225
    :catch_15
    move-exception v0

    goto :goto_10
.end method

.method revertAndEndBackup()V
    .registers 5

    .prologue
    .line 2187
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/BackupManagerService$BackupRequest;

    .line 2188
    .local v1, request:Lcom/android/server/BackupManagerService$BackupRequest;
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v1, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    #calls: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    goto :goto_6

    .line 2192
    .end local v1           #request:Lcom/android/server/BackupManagerService$BackupRequest;
    :cond_1a
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->restartBackupAlarm()V

    .line 2193
    return-void
.end method
